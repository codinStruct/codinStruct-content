# Operador `sizeof`

O padrão C economiza palavras ao falar sobre os tamanhos de objetos de cada tipo
na memória. É possível que em uma plataforma um `int` ocupe 2 bytes, e em outra
ocupe 8. Por isso, existe o operador `sizeof` para descobrir o tamanho em bytes
de um tipo ou objeto.

A aplicação do operador `sizeof` pode se dar de duas formas:

1. `sizeof(tipo)`: Equivale ao tamanho em bytes de um objeto desse tipo.
2. `sizeof expressão`: Equivale a `sizeof(tipo)` com `tipo` sendo o tipo da
   expressão. Pode também ser escrito `sizeof(expressão)`.

Ambas formas retornam um valor do tipo inteiro sem sinal `size_t` (definido em
`<stddef.h>`).

## Usos Simples

Um exemplo de uso do operador `sizeof` é não precisar digitar manualmente o
tamanho de um array para percorrê-lo em um laço `for`. Os dois trechos abaixo
são equivalentes, porém utilizando `sizeof`, ao alterar o array a condição não
precisa ser alterada.

```c
int array[10];

/* ... */

// Percorre todos elementos do array
for (size_t i = 0; i < 10; i = i + 1)
    /* ... */
```

```c
int array[10];

/* ... */

// Percorre todos elementos do array
for (size_t i = 0; i < sizeof array / sizeof array[0]; i = i + 1)
    /* ... */
```

A expressão `sizeof array / sizeof array[0]` resulta no número de elementos no
array após 3 passos:

1. Calcular o valor de `sizeof array`. `array` é do tipo `int[10]`, portanto o
   valor é `sizeof(int) * 10` (pois um array de 10 `int`s é 10 vezes maior que
   um `int`).
2. Calcular o valor de `sizeof array[0]`. `array[0]` é um dos elementos do
   array, portanto seu tipo é `int`. Isso se torna `sizeof(int)`.
3. Dividindo `sizeof(int) * 10` por `sizeof(int)` temos o resultado `10`, que é
   o número de `int`s no array.

`sizeof(char)` é sempre `1`, portanto o número de elementos em um array de
`char` pode ser calculado utilizando simplesmente `sizeof(array)`. Utilize essa
versão reduzida com moderação pois pode causar erros caso o tipo armazenado no
array seja alterado por alguma mudança no código.

## Quantos Bits Tem Um Byte?

Curiosamente, o padrão ISO não especifica quantos bits há em um byte. A
quantidade de bits em um byte no seu sistema é especificada no valor de
`CHAR_BIT` (`<limits.h>`). Atualmente é muito provável que no seu caso esse
valor seja `8`.

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310:
  <!-- Macro CHAR_BIT -->
  - 5.2.4.2.1 Sizes of integer types <limits.h>
  <!-- Operador sizeof -->
  - 6.5.3.4 The sizeof and \_Alignof operators
  <!-- Tipo size_t -->
  - 7.19 Common definitions <stddef.h>
