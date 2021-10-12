# Entrada e saída básica

As funções de entrada e saída do C permitem ao programa interagir com o usuário
lendo e exibindo informações. Algumas funções para isso são `puts`, `putchar`,
`printf` e `scanf`—todas incluídas em `<stdio.h>`.

## Função `puts`

A função `puts` recebe uma string (sequência de caracteres) e a exibe. Podemos
exibir a string `"Olá, Mundo!"` simplesmente utilizando-a como argumento de
`puts`:

```c
puts("Olá, Mundo!"); // Saída: Olá, Mundo!
```

A função `puts` automaticamente insere uma quebra de linha (`\n`) na saída após
a string fornecida, portanto a próxima operação de saída ocorrerá na linha
seguinte:

```c
puts("Essa é a 1ª linha");
puts("Essa é a 2ª linha");
puts("Essa é a 3ª linha");
/* Saída:
 * Essa é a 1ª linha
 * Essa é a 2ª linha
 * Essa é a 3ª linha
 */
```

Várias chamadas seguidas de `puts` com literais string (strings predefinidas,
entre aspas duplas) podem ser substituídas por apenas uma:

```c
puts("Essa é a 1ª linha\n"
     "Essa é a 2ª linha\n"
     "Essa é a 3ª linha");
/* Saída:
 * Essa é a 1ª linha
 * Essa é a 2ª linha
 * Essa é a 3ª linha
 */
```

Note que as três strings passadas para `puts` não estão separadas por vírgula,
portanto o compilador as mescla em uma só—processo que ocorre com literais
string. O resultado final é o mesmo que ao utilizar a string
`"Essa é a 1ª linha\nEssa é 2ª linha\nEssa é a 3ª linha"`, porém dividir as
linhas torna o código mais compreensível. Utilize essa funcionalidade para uma
melhor legibilidade de código.

Tentar separar as três strings utilizando vírgulas resultará em um erro, pois
serão consideradas três argumentos e a função `puts` deve receber apenas um:

```c
// Erro: Passando três argumentos para uma função que recebe apenas um
puts("Essa é a 1ª linha\n",
     "Essa é a 2ª linha\n",
     "Essa é a 3ª linha");
```

Se os caracteres `é` e/ou `ª` não forem exibidos corretamente, seu sistema
operacional pode estar simplesmente utilizando um conjunto de caracteres que não
os suporta.

## Função `putchar`

A função `putchar` é similar à função `puts`, porém exibe apenas um caractere e
não insere uma quebra de linha. Seu uso é simples, basta fornecer um caractere:

```c
putchar('O');
putchar('i');
putchar('!');
// Saída: Oi!
```

Não esqueça que funções podem receber variáveis, não apenas valores manualmente
especificados. Imaginando que `v` é uma variável do tipo `char`, `putchar(v);`
exibirá seu valor.

Aqui está um exemplo de um programa simples, com uma função (`ExibirDuo`) que
recebe dois caracteres e os exibe com uma exclamação no final:

```c
#include <stdio.h>

void ExibirDuo(char primeiro, char segundo)
{
    putchar(primeiro);
    putchar(segundo);
    putchar('!');
}

int main(void)
{
    ExibirDuo('O', 'i');
    // Saída: Oi!

    return 0;
}
```

Não se engane, a função `ExibirDuo` é apenas um exemplo e não deve ser muito
útil em um projeto sério.

## Função `printf`
