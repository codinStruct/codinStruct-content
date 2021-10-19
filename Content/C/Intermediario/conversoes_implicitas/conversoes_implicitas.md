# Conversões implícitas

Com a intenção de simplificar o código, em algumas situações os compiladores C
convertem valores para outros tipos mesmo sem um cast. Esse processo realmente
facilita o desenvolvimento, mas é necessário compreendê-lo para que não ocorram
imprevistos. Essas conversões possuem regras complexas, memorizá-las é
preferível mas pode ser desnecessário para programas relativamente simples.

## Conversões de atribuição

Os tipos inteiros são claramente diferentes dos tipos de ponto flutuante. Essa
diferença não se dá somente nos valores que podem assumir, mas também na
representação dos mesmos na memória.

```c
int i = 1;
float f = 1;
```

Por mais que `i` e `f` possuam o mesmo valor, ele pode ser representado de forma
diferente em cada objeto. O seguinte código exibe a representação hexadecimal
dos bytes que compõem esses objetos:

```c
for (int x = 0; x < sizeof(i); ++x)
    printf("%.2hhx ", ((unsigned char *)&i)[x]);

putchar('\n');

for (int x = 0; x < sizeof(f); ++x)
    printf("%.2hhx ", ((unsigned char *)&f)[x]);
```

<!-- ? Esse código funciona em qualquer implementação? -->

A seguinte tabela exibe as informações obtidas executando os trechos acima em
certo sistema Linux x86-64:

|       | i           | f           |
| ----- | ----------- | ----------- |
| Valor | 1           | 1           |
| Bytes | 01 00 00 00 | 00 00 80 3f |

Até atribuindo o valor de `f` para `i` com `i = f` e executando o código
novamente, os resultados são os mesmos que na tabela. Como isso é possível?

Esse é o efeito das conversões de atribuição no C. Para não haver resultados
inesperados, o compilador gera código que converte o valor em ponto flutuante
para um valor inteiro mesmo que as representações não batam. Isso significa que
ao executar `i = f`, a memória não é apenas copiada mas também convertida na
atribuição.

## Promoções inteiras

Todos tipos inteiros possuem a propriedade abstrata quantitativa rank, e aqui
está a relação entre os ranks dos inteiros padrões: `_Bool` < (`char` e
`signed char`) < `short` < `int` < `long` < `long long` (Um tipo sem sinal
possui o mesmo rank que sua contraparte com sinal). Essa propriedade define em
parte como as conversões entre tipos inteiros ocorrem.

Promoções inteiras são conversões implícitas de um valor de tipo inteiro para
`int` ou `unsigned int`, com as seguintes regras:

- Se o tipo do valor possuir rank menor que o de `int`:
  - Se `int` puder representar qualquer valor desse tipo:
    - O valor é convertido para `int`.
  - Caso contrário:
    - O valor é convertido para `unsigned int`.
- Caso contrário:
  - O valor mantém seu tipo.

Os casos em que promoções inteiras ocorrem são bem especificados no padrão ISO
mas não entraremos em muitos detalhes aqui. Por agora, basta saber que essas
promoções ocorrem nos operadores unários `+` e `-`, nas conversões aritméticas
usuais, e também na passagem de argumentos para funções variádicas—funções que
recebem um número arbitrário de argumentos de qualquer tipo—ou sem protótipo.

Por em isso sistemas em que `int` consegue armazenar qualquer valor `char`
(virtualmente todos sistemas e até placas Arduino) a função `printf` (que é
variádica) exibe corretamente um `char` mesmo com a string de formato `"%d"`.
Afinal, esse `char` é convertido para `int` antes da função recebê-lo.

```c
char a,
     b = 2,
     c = 3;

// b e c são convertidos para int (ou unsigned) e somados, e o resultado é
//  convertido de volta para char e armazenado em a.
a = b + c;

// Em sistemas onde int pode representar qualquer char, o valor de a é
//  convertido para int e passado para printf, que deve exibir "a == 5"
printf("a == %d", a);

// Em raros sistemas onde int não pode representar qualquer char, o valor de a é
//  convertido para unsigned int e passado para printf, que deve exibir "a == 5"
printf("a == %u", a);
```

## Conversões aritméticas usuais

As conversões aritméticas usuais ocorrem quando um operador aritmético é
aplicado a operandos de diferentes tipos, portanto há a necessidade de pelo
menos um deles ser convertido. Esse processo segue várias regras bem
estabelecidas no padrão C ISO. Resumidamente:

- Se um operando for do tipo `long double`:
  - O outro operando é convertido para `long double`
- Caso contrário, se um operando for do tipo `double`:
  - O outro operando é convertido para o tipo `double`
- Caso contrário, se um operando for do tipo `float`:
  - O outro operando é convertido para o tipo `float`
- Caso contrário, as promoções inteiras ocorrem onde aplicável.

- Se após isso os operandos ainda forem de diferentes tipos:
  - Se um tipo possuir sinal e outro não (ex. `int + unsigned long`):
    - Se o rank do tipo sem sinal for maior ou igual que o outro:
      - O tipo com sinal é convertido para o tipo sem sinal.
    - Caso contrário:
      - Se o tipo com sinal puder representar qualquer valor do tipo sem sinal:
        - O tipo sem sinal é convertido para o tipo com sinal.
      - Caso contrário:
        - Ambos operandos são convertidos para a versão sem sinal do tipo com
          sinal.
  - Caso contrário (ex. `int + long`):
    - O tipo de menor rank é convertido para o tipo de maior rank.

Quando consideramos tipos complexos e imaginários as regras são similares, porém
tipos complexos só se convertem para tipos complexos e tipos imaginários só se
convertem para tipos imaginários, enquanto tipos reais continuam sendo reais.

## Considerações sobre desempenho

Quando seu objetivo for atingir desempenho máximo em um programa, tenha em mente
o custo da conversão entre tipos. Em um certo sistema x86-64 a atribuição da
variável `int b` à variável `int a` é feita com duas instruções:

1. O valor de `b` é copiado para um registrador.
2. O valor desse registrador é copiado para `a`.

Se a variável `b` fosse `float`, o processo seria mais longo:

1. O valor de `b` é copiado para um registrador.
2. O valor desse registrador é convertido para um valor inteiro com sinal e
   copiado para um segundo registrador.
3. O valor do segundo registrador é copiado para `a`.

E com `b` do tipo `long double`, dez instruções são necessárias!

Embora os números acima sejam alarmantes, não faça otimizações sem necessidade.
Em muitos casos a legibilidade do código é mais importante que seu desempenho,
portanto saiba quando priorizar a manutenibilidade do seu código.

## Referências

- Padrão C18 ([ISO/IEC 9899:2018](https://www.iso.org/standard/74528.html)):
  - 6.2.5 Types
  - 6.2.6 Representations of types
  - 6.3 Conversions:
    - 6.3.1.8 Usual arithmetic conversions
    <!-- Conversões usadas na atribuição -->
  - 6.5.16 Assignment operators
