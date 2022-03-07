# Entrada Básica

As funções de entrada do C permitem ao programa interagir com o usuário lendo
informações. A função principal que usaremos pra isso é a função `scanf` de
`<stdio.h>`.

## Função `scanf`

Assim como `printf`, a função `scanf` recebe uma string de formato; a diferença
é que nesse caso a string determina não o que será exibido, mas o que será lido.

Os modificadores de comprimento e especificadores de conversão na string de
formato determinam o tipo do valor que será lido. Vejamos algumas especificações
(todas devem iniciar com `%`):

| Modificador | Especificador | Significado                                              |
| ----------: | :------------ | -------------------------------------------------------- |
|             | c             | Um caractere, será armazenado em um `char`               |
|             | d             | Um número inteiro, será armazenado em um `int`           |
|           l | d             | Um número inteiro, será armazenado em um `long int`      |
|          ll | d             | Um número inteiro, será armazenado em um `long long int` |
|             | f             | Um número real, será armazenado em um `float`            |
|           l | f             | Um número real, será armazenado em um `double`           |
|           L | f             | Um número real, será armazenado em um `long double`      |

Diferente de `printf`, perceba que `scanf` utiliza a especificação `%f` para
`float` e `%lf` para `double`. Você não deve utilizar `%f` no lugar de `%lf` ou
`%d` lugar de `%c` e vice-versa.

Para armazenar um valor lido com uma especificação de conversão, precisamos
especificar seu alvo (uma localização na memória). No nosso caso, utilizaremos o
operador `&` (que será explicado depois) para obter o endereço de uma variável
na memória:

```c
int n;
scanf("%d", &n);
```

A chamada de função acima lê um número inteiro da entrada e armazena seu valor
em `n` por meio de seu endereço na memória. A especificação `%d` descarta
quaisquer caracteres white-space da entrada até encontrar outro tipo de
caractere, portanto esse `scanf` funciona com qualquer número de caracteres
white-space precedendo o número na entrada.

Antes de continuar é importante definir o que é um caractere white-space. Essa
expressão se refere a qualquer caractere da lista abaixo.

- `' '` (espaço)
- `'\t'` (tabulação horizontal)
- `'\v'` (tabulação vertical)
- `'\n'` (quebra de linha)
- `'\f'` (quebra de página)

Retomando nosso foco, já podemos fazer um simples programa com entrada e saída:

```c
#include <stdio.h>

int main(void)
{
    printf("Digite um número inteiro: ");
    int num;
    scanf("%d", &num);

    printf("O número digitado foi %d.\n", num);

    return 0;
}
```

Execute o código acima e tente fazê-lo produzir um resultado incorreto. A
leitura do número pode dar errado de várias formas, incluindo:

- A entrada não é um número. Nesse caso o `scanf` não modifica a entrada (exceto
  por descartar caracteres white-space iniciais) e ela pode ser lida
  futuramente.
- O número digitado pode ser grande demais para ser armazenado em um `int`.
  Nesse caso o comportamento do programa é indefinido.
- O número digitado pode conter casas decimais, e nesse caso o separador decimal
  e todos dígitos seguintes serão ignorados.

Com a especificação `%d` a sequência de dígitos será lida até um caractere de
outro tipo (ex. uma letra) ser encontrado. Com a entrada `163p90`, `scanf`
associará `163` ao `%d` e `p90` continuará na entrada para ser lido futuramente.

Podemos decompor a entrada `163p90` em duas variáveis `int` e uma `char` da
seguinte forma:

```c
int n1,
    n2;

char ch;

scanf("%d%c%d", &n1, &ch, &n2);

printf("n1: %d\n"
       "n2: %d\n"
       "ch: %c\n", n1, n2, ch);
```

O `scanf` acima associa `163` ao primeiro `%d`, armazena o valor em `n1` e a
sequência `p90` continua na entrada. O próximo caractere (`'p'` nesse caso) se
associa ao `%c` e é armazenado em `ch`. O último `%d` recebe o inteiro `90` que
é armazenado em `n2`. Depois, os valores são exibidos com `printf`.

Quando um caractere da string de formato não faz parte de uma especificação de
conversão, o `scanf` verificará se esse caractere é igual ao próximo caractere
da entrada. Se sim, o caractere da entrada é descartado e prosseguimos com a
string de formato, caso contrário a execução do `scanf` para.

```c
printf("Quantos anos você tem? ");
int idade;
scanf("Eu tenho %d", &idade);
```

O `scanf` acima só chega ao `%d` se todos caracteres anteriores forem
correspondentes na entrada. Se a entrada for `Eu tenho 5`, o valor de `idade`
será 5, mas a entrada `Eu tinha 5` não armazena nada em `idade` e seu valor é
indeterminado. Um espaço na string de formato se encaixa em qualquer número
(inclusive zero) de caracteres white-space na entrada, então a entrada
`Eutenho5` também funciona corretamente.

A string de formato `"Eu tenho%d"` também funciona corretamente pois, como dito
no início, a especificação `%d` automaticamente pula qualquer espaço em branco
até encontrar um caractere non-white-space (caracteres não white-space, como
letras e dígitos).

Não se esqueça que após digitar um número e ele ser lido, o `scanf` não descarta
o caractere de quebra de linha (`\n`) do final da linha de entrada. Isso pode
fazer com que esse caractere se associe a uma futura especificação `%c` e isso
pode ser indesejado. Para descartar esse caractere de uma forma simples, utilize
um espaço antes da especificação `%c` e isso pulará a quebra de linha.

Aqui está um código em que a quebra de linha na entrada pode ser prejudicial:

```c
int num;
scanf("%d", &num);

char ch;
scanf("%c", &ch); // Isso lerá uma quebra de linha se o usuário tiver digitado
                  //  um número e pressionado ENTER.

printf("O caractere lido é '%c'\n", ch);
```

E aqui está uma versão que se previne disso:

```c
int num;
scanf("%d", &num);

char ch;
//     ↓
scanf(" %c", &ch); // O usuário pode inserir espaços e pressionar ENTER o quanto
                   // quiser. Apenas um caractere non-white-space se associará.

printf("O caractere lido é '%c'\n", ch);
```

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310
  <!-- Sequências de escape -->
  - 5.2.2 Character display semantics
  <!-- Caracteres white-space -->
  - 6.4 Lexical elements
  <!-- Comportamento que se aplica à função scanf -->
  - 7.21.6.2 The fscanf function
