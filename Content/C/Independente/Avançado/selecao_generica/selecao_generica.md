# Seleção genérica

## Funções genéricas tradicionais

Funções genéricas são um ponto fraco do C. Quando queremos que uma função
funcione com parâmetros de qualquer tipo, é comum recebê-los com o tipo
`void *`. Como passar um argumento como `void *` remove as informações sobre seu
tipo original, muitas vezes a função "genérica" precisa também receber outra
função que sabe lidar com o tipo original do argumento. Aqui está a
implementação de uma função `Max` genérica:

```c
// Recebe o endereço de dois valores e uma função comparadora, e retorna o
//  endereço do maior entre os dois valores utilizando o comparador.
void *Max(void *lhs, void *rhs, int cmp(void *lhs, void *rhs))
{
    return cmp(lhs, rhs) < 0 ? rhs : lhs;
}
```

Interpretar essa declaração de `Max` deve ser simples para programadores
experientes, mas para chamar a função é necessário ter um comparador definido e
isso pode ser contraproducente. É possível que por falta de conhecimento
múltiplos comparadores equivalentes sejam definidos no mesmo programa,
introduzindo redundância. Aqui está um exemplo onde há dois comparadores
equivalentes:

```c
int CmpInt1(void *lhs, void *rhs)
{
    return *(int *)lhs - *(int *)rhs;
}

int CmpInt2(void *lhs, void *rhs)
{
    return *(int *)lhs - *(int *)rhs;
}
```

Chamar `Max` com qualquer um desses comparadores terá o mesmo resultado,
portanto ter mais de um é desnecessário. Uma maneira de evitar esse problema é
criar um wrapper de `Max` específico para comparar dois `int` da mesma forma que
os comparadores acima.

```c
// Comparador interno para MaxInt
static int MaxIntCmp(void *lhs, void *rhs)
{
    return *(int *)lhs - *(int *)rhs;
}

int MaxInt(int lhs, int rhs)
{
    return *(int *)Max(&lhs, &rhs, MaxIntCmp);
}
```

O problema de redundância foi resolvido. Não há mais necessidade de criar
comparadores e `MaxInt` recebe e retorna valores `int` diretamente, mas temos
outros problemas: O excesso de ponteiros e indireções pode impactar
consideravelmente o desempenho da função, e agora temos duas funções que fazem
essencialmente a mesma coisa: `Max` e `MaxInt`. Nesse ritmo, teremos também
`MaxShort`, `MaxUnsignedShort`, `MaxUnsigned`, `MaxLong` etc. e digitar um nome
diferente para realizar a mesma operação em cada tipo não agrada muitos
desenvolvedores.

Essa é uma situação comum no desenvolvimento de software: A solução de um
problema causar mais problemas. Existe, afinal, alguma forma padrão de amenizar
todos os problemas acima?

## Palavra-chave \_Generic

A palavra-chave `_Generic` foi adicionada no padrão C11 e recebe uma expressão
controladora seguida de uma lista de associações. Uma associação possui a
sintaxe `tipo: expressão` e o compilador escolhe qual expressão avaliar com base
no tipo da expressão controladora. Talvez você tenha morrido por dentro ao ler
isso, mas é mais simples do que parece:

```c
int v;

// O compilador transformará isso em puts("v é um int");
_Generic(v, char:    puts("v é um char"),
            int:     puts("v é um int"),
            float:   puts("v é um float"),
            default: puts("v não é char, int, ou float"));
```

No código acima temos a expressão controladora `v` e três associações. Se a
expressão controladora `v` possuir o tipo `char`, a seleção genérica será
substituída pela expressão `puts("v é um char");`. A palavra-chave `default`
define uma associação para tipos que não se encaixam em nenhuma associação
anterior.

Você talvez tenha notado que a seleção genérica se comporta de forma similar à
instrução `switch`, porém resolvida durante a compilação e baseada em um tipo e
não em um valor. Esse é um ponto de vista válido, mas a seleção genérica
apresenta um detalhe importante: Sua expressão controladora não é avaliada. Isso
significa que a expressão controladora `puts("Olá, Mundo!")` não exibirá nada na
tela, e a expressão controladora `exit(0)` não finalizará o programa. O
compilador deve saber previamente tipo de retorno dessas funções, portanto não
há necessidade de executá-las para realizar a seleção.

Enfim, como utilizar isso para resolver os problemas de nossas funções `Max` e
`MaxInt`?

```c
#define MAX(lhs, ...) _Generic(lhs, int:     MaxInt,\
                                    default: Max)(lhs, __VA_ARGS__)

void *Max(void *lhs, void *rhs, int cmp(void *lhs, void *rhs))
{
    return cmp(lhs, rhs) < 0 ? rhs : lhs;
}

int MaxInt(int lhs, int rhs)
{
    return lhs < rhs ? rhs : lhs;
}
```

Agora não precisamos utilizar `Max` ou `MaxInt` explicitamente. Basta utilizar o
macro `MAX` com os parâmetros desejados, e o compilador selecionará a função
mais apropriada:

```c
// Comparador para floats
int CmpFloat(void *lhs, void *rhs)
{
    return *(float *)lhs == *(float *)rhs ?  0 :
           *(float *)lhs < *(float *)rhs  ? -1 :
                                             1;
}

int main(void)
{
    int ai = 5,
        bi = 3;

    float af = 5.f,
          bf = 3.f;

    // Isso se torna int vi = MaxInt(ai, bi);
    int vi = MAX(ai, bi);

    // Isso se torna float vf = *(float *)Max(&af, &bf, CmpFloat);
    float vf = *(float *)MAX(&af, &bf, CmpFloat);

    // vi agora vale 5 e vf agora vale 5.0

    return 0;
}
```

Como o tipo `float` não possui nenhuma associação explícita na seleção genérica,
a função `Max` é selecionada e precisamos utilizar ponteiros (eliminando a
possibilidade de utilizar rvalues). Para resolver isso, basta criar uma função
para comparar valores `float`:

```c
#define MAX(lhs, ...) _Generic(lhs, int:     MaxInt,\
                                    float:   MaxFloat,\
                                    default: Max)(lhs, __VA_ARGS__)

void *Max(void *lhs, void *rhs, int cmp(void *lhs, void *rhs))
{
    return cmp(lhs, rhs) < 0 ? rhs : lhs;
}

int MaxInt(int lhs, int rhs)
{
    return lhs < rhs ? rhs : lhs;
}

float MaxFloat(float lhs, float rhs)
{
    return lhs < rhs ? rhs : lhs;
}
```

Agora podemos utilizar `MAX` com valores `float` sem ponteiros:
`float vf = MAX(af, bf)`. O uso de rvalues também se torna possível:
`float vf = MAX(5.f, 3.f)`.

Há vários meios de melhorar nossa seleção genérica. As funções `MaxInt` e
`MaxFloat` podem ser criadas com macros, pois têm a mesma estrutura. Também há
como aninhar palavras-chave `_Generic` para que `MAX` não precise de ponteiros
na associação `default`. As possibilidades são incontáveis e não é difícil
exagerar ao ponto de tornar o código virtualmente ilegível, mas se usadas
corretamente, seleções genéricas são uma forma padronizada de lidar com diversos
problemas.
