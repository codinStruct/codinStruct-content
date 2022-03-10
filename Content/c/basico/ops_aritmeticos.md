# Operadores Aritméticos Básicos

Virtualmente toda manipulação de dados em um programa C é feita por operadores,
que são tokens que indicam ações a serem realizadas com seus operandos (valores
que a operação recebe).

Na matemática, a soma é uma operação representada por `+` e se aplica a dois
valores, i.e. uma operação binária. A aridade de uma função/operação é o número
de operandos que ela recebe. Uma operação é unária quando tem aridade 1 e
binária quando tem aridade 2.

No C é possível separar os operadores em grupos de acordo com a aridade de cada
um, e vamos fazer isso agora.

## Operadores Binários

Todos os operadores binários no C recebem um operando de cada lado, no formato
`<operando> <operador> <operando>` (o número de espaços não importa, podendo ser
até mesmo zero).

### `+` binário

O operador binário `+` funciona igual na matemática: o valor da operação é a
soma dos dois operandos. `5 + 3`, por exemplo, é uma expressão de valor 8.

Como exemplo, aqui está um programa que soma dois números que o usuário digitar:

```c
#include <stdio.h>

int main(void)
{
    int a, b;
    printf("Digite dois números: ");
    scanf("%d%d", &a, &b); // "%d %d" pode ser mais legível
    printf("%d\n", a + b);

    return 0;
}
```

### `-` binário

O operador binário `-` funciona de forma parecida ao operador `+` binário, porém
o valor resultante é o valor do operando à esquerda subtraído pelo valor do
operando à direita. `5 - 3`, por exemplo, é uma expressão de valor 2.

### `*`

O operador binário `*` realiza a multiplicação de seus operandos. O valor de
`5 * 3` é 15.

### `/`

O operador binário `/` realiza a divisão do valor do operando à esquerda pelo
valor do operando à direita. O valor de `5 / 3` é 1. Como ambos operandos são
inteiros o resultado é um inteiro (A parte fracionária é removida). Se algum dos
operandos fosse real, e.g. `5 / 3.`, o resultado seria a dízima infinita
1,666..., arredondada conforme seu sistema.

### `%`

O operador binário `%` resulta no resto da divisão (inteira) do operando à
esquerda pelo operando à direita. O valor de `5 % 3`, e.g., é 2, pois resultado
da divisão inteira é 1 e o resto é 2.

Mais alguns exemplos:

| Operação  | Valor | Raciocínio                                                       |
| :-------: | :---: | ---------------------------------------------------------------- |
| `10 % 3`  |   1   | `10 / 3` é igual a 3, `3 * 3` é igual a 9, e `10 - 9` é 1        |
| `10 % 2`  |   0   | `10 / 2` é igual a 5, `2 * 5` é igual a 10, e `10 - 10` é 0      |
| `40 % 7`  |   5   | `40 / 7` é igual a 5, `7 * 5` é igual a 35 e `40 - 35` é 5       |
| `-10 % 3` |  -1   | `-10 / 3` é igual a -3, `3 * -3` é igual a -9 e `-10 -(-9)` é -1 |

## Operadores Unários

A maioria dos operadores unários ficam à esquerda do operando, no formato
`<operador> <operando>` (o número de espaços geralmente não importa).

### `+` unário

O operador unário `+` é quase sempre um no-op—uma operação que não faz nada.

Apenas em alguns casos, o operador unário `+` irá converter seu operando para
outro tipo. Esse processo é chamado promoção inteira, que será detalhado bem
depois.

Por enquanto, não se preocupe com esse operador, pois é raro encontrar um motivo
legítimo para usá-lo.

### `-` unário

Diferente do `+` unário, esse operador raramente é um no-op. Ele inverte o sinal
de seu operando, transformando 50 em -50, -25 em 25, etc.

Ele pode ser no-op quando seu operando possui valor zero, mas em alguns sistemas
é possível distinguir entre zero positivo e zero negativo. Não se preocupe muito
com isso, pois o sinal do zero raramente altera o comportamento de um programa.

Como exemplo de uso do `-` unário, aqui está um programa que inverte o número
que o usuário digitar:

```c
#include <stdio.h>

int main(void)
{
    int num;

    printf("Digite um número: ");
    scanf("%d", &num);
    printf("%d\n", -num);

    return 0;
}
```

## Precedência

Assim como na matemática, aqui temos o conceito de precedência de operadores.
Isso significa que alguns operadores são executados antes dos outros,
independente da ordem de escrita em uma expressão.

Os operadores `*` e `/` possuem maior precedência que os operadores binários `+`
e `-`, portanto, a expressão `a + b / 2` é o mesmo que `a + (b / 2)`. As versões
unárias de `+` e `-` possuem maior precedência que todos os operadores acima,
portanto `a + b * -c` é o mesmo que `a + (b * (-c))`.

Aqui estão mais alguns exemplos da precedência desses operadores:

```c
int   a = 1 + 2 * 3;   // a = 7
int   b = 10 + 2 / 2;  // b = 11
float c = 1 + 3.f / 2; // c = 2.5
                       // Perceba o ".f" após o 3. Isso torna 3 um float
                       //  para que a divisão produza um resultado real.
```

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310:
  - 6.5 Expressions:
    <!-- Operadores unários + e - -->
    - 6.5.3.3 Unary arithmetic operators
    <!-- Operadores binários *, / e % -->
    - 6.5.5 Multiplicative operators
    <!-- Operadores binários + e - -->
    - 6.5.6 Additive operators
