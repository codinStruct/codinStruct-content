# Saída básica

As funções de saída do C permitem ao programa interagir com o usuário exibindo
informações. Algumas funções para isso são `puts`, `putchar` e `printf`—todas
incluídas em `<stdio.h>`.

## Função `puts`

A função `puts` recebe uma string (sequência de caracteres) e a exibe. Podemos
exibir a string `"Olá, Mundo!"` simplesmente utilizando-a como argumento de
`puts`:

```c
puts("Olá, Mundo!"); // Saída: Olá, Mundo!
```

Note o uso de aspas duplas. Diferente de um `char`, uma string não deve ser
delimitada por aspas simples.

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
portanto o compilador as mescla em uma só (processo que ocorre com literais
string). O resultado final é o mesmo que ao utilizar a string
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

A função `printf`, diferente de `puts`, tem a capacidade de formatar os dados
antes de exibí-los. O primeiro parâmetro da função é uma string de formato, que
informa à função a série de operações de saída a serem realizadas.

A string `"Hello, World!"`, ao ser usada como string de formato, faz com que
`printf` simplesmente a exiba. Para realizarmos operações de saída mais
complexas, utilizamos especificações de conversão, como `%d`. Vamos dissecá-la:

1. **%**: Introduz uma especificação de conversão.
1. **d**: Um _especificador_ de conversão. Indica um valor do tipo `int` em
   base 10.

Ao exibir, `printf` substitui as especificações de conversão pelos valores dos
argumentos recebidos. Por exemplo:

```c
// %d é substituído pelo argumento 5
// Saída: O valor de 5 é 5
printf("O valor de 5 é %d", 5);
```

Quando há várias especificações de conversão, a enésima especificação é
substituída pelo enésimo argumento após a string de formato:

```c
// O 1º %d é substituído pelo 1º argumento após a string de formato (5)
// O 2º %d é substituído pelo 2º argumento após a string de formato (9)
// Saída: O valor de 5 é 5 e o valor de 9 é 9
printf("O valor de 5 é %d e o valor de 9 é %d", 5, 9);
```

Para os diversos tipos há diversos especificadores de conversão. Vejamos alguns
deles:

| Especificador | Significado                                          |
| :-----------: | ---------------------------------------------------- |
|       c       | Um `char`, exibido como um caractere                 |
|       u       | Um `unsigned int`, exibido em base 10                |
|       f       | Um `double`, exibido com 6 casas decimais por padrão |
|       s       | Uma string                                           |

E alguns exemplos de uso:

```c
// %s é substituído por "falar da".
// Saída: Você já ouviu falar da tragédia de Darth Plagueis, o sábio?
printf("Você já ouviu %s tragédia de Darth Plagueis, o sábio?", "falar da");

// %f é substituído pelo valor da expressão acos(-1), função de <math.h>.
// Isso exibirá um valor aproximado de π com 6 casas decimais, e pode variar
//  conforme seu sistema. Teste você mesmo.
printf("O valor de pi é %f", acos(-1));

// %c é substituído pelo caractere "+".
// Saída: 1 + 1
printf("1 %c 1", '+');
```

Diferente do que acontece com `puts`, o repetido uso de `printf` acima irá
exibir toda a saída em uma linha só. Para iniciar uma nova linha utilize a
sequência de escape `\n` no final da string de formato anterior ou no início da
string de formato atual, por exemplo:

```c
printf("Você já ouviu falar da tragédia de Darth Plagueis, o sábio?\n");
printf("Não");

// Alternativamente:
printf("Você já ouviu falar da tragédia de Darth Plagueis, o sábio?");
printf("\nNão");
```

Nos casos acima seria melhor utilizar `printf` apenas uma vez, mas serve como
exemplo. Mesmo assim, aqui está uma forma de exibir com um `printf`:

```c
printf("Você já ouviu falar da tragédia de Darth Plagueis, o sábio?\n"
       "Não");

// Alternativamente:
printf("Você já ouviu falar da tragédia de Darth Plagueis, o sábio?\nNão");
```

Na primeira opção acima as duas strings se tornam um argumento só, efetivamente
causando o mesmo resultado que a segunda opção. Esse processo foi explicado em
[Função puts](#função-puts).

O especificador de conversão `f` irá funcionar até quando o argumento
correspondente for `float` e o especificador `d` irá funcionar até quando o
argumento correspondente for `short`. A razão disso é relativamente complexa,
portanto só é explicada em páginas mais avançadas.
