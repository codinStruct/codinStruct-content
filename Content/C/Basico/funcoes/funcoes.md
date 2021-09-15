# Funções

## O que são?

Em C uma função é um bloco de código que pode ser executado quando necessário. O
ponto de entrada `main`, utilizado até nos programas mais simples, é uma função.
Funções podem também receber e retornar dados, e isso é muito importante.

Um grande motivo para utilizar uma função é que basta utilizar o nome dela para
executá-la. Não é necessário reescrever seu código, e isso facilita o
desenvolvimento de qualquer programa.

## Definição e uso

Definir uma função é simples e consiste em especificar:

1. O tipo de dado que a função retorna.
1. O nome da função.
1. Os dados que a função recebe (parâmetros).
1. O código que deve ser executado pela função.

Vamos criar uma função simples chamada `foo`. Funções que não retornam algum
valor possuem o tipo `void`, então começamos com:

```c
void foo
```

Agora, imagine que queremos que `foo` receba um número inteiro que será chamado
`num`. Inteiros podem ser representados com o tipo `int` (outros tipos serão
mostrados mais à frente):

```c
void foo(int num)
```

A função ainda não possui um corpo. Precisamos escrever algum código para ser
executado, então faremos `foo` multiplicar `num` por `2`:

```c
void foo(int num)
{
  num * 2;
}
```

Como a função não retorna nenhum valor, a operação `num * 2` é realizada em vão.
Vamos fazer a função retornar o resultado da operação, e para isso basta trocar
`void` por `int` (número inteiro) e usar a palavra-chave `return`, que faz a
função retornar o valor à sua frente (em nosso caso, `num * 2`):

```c
int foo(int num)
{
  return num * 2;
}
```

A função está pronta. Para utilizá-la, basta chamá-la e fornecer um número:

```c
foo(5);
```

Isso é uma expressão que resulta no valor `10`.

## Funções na biblioteca padrão

Antes de criar uma função, verifique se uma equivalente já não existe na
biblioteca padrão do C. Para calcular o logaritmo natural de um número, por
exemplo, basta utilizar a função `log` do arquivo `math.h`. Um programa que
calcula o logaritmo natural de `5` pode ser feito assim:

```c
#include <math.h>

int main(void)
{
  log(5);

  return 0;
}
```

Embora `math.h` seja parte da biblioteca padrão, seu respectivo código pode não
ser ligado automaticamente ao programa. Para solicitar a ligação no compilador
GCC, adicione o argumento `-lm` na compilação (e.g. `gcc main.c -lm`). Em outros
compiladores o procedimento pode ser diferente.

Lembre-se também que a linha `return 0;` existe apenas para informar ao sistema
operacional que o programa terminou de executar corretamente.
