# Arrays

Até agora vimos apenas tipos escalares—representam objetos conceitualmente
indivisíveis. Um `int` é logicamente composto por um único inteiro, e não várias
entidades. Tipos compostos por múltiplas partes são chamados agregados, e arrays
são um exemplo disso.

Arrays representam sequências de objetos do mesmo tipo, e.g. 5 `float`s. A
declaração de um array é parecida com a de uma variável comum, mas possui
colchetes após o identificador, e.g. `int v[]`. Entre os colchetes especificamos
o comprimento do array, ou seja a quantidade de elementos que ele possui. Para
criar um array de 5 `int`s chamado `v`, usaríamos `int v[5]`.

```c
// Um array de 9 chars
char c[9];

// Um array de 2 ints
int i[2];

// Um array de 13 floats
float f[13];
```

Após criar um array, você pode acessar um de seus valores utilizando o operador
`[]` (subscrito). Interessantemente, nesse operador um dos operandos fica entre
os colchetes.

```c
// Acessa o 5º char do array c
c[4];

// Acessa o 1º int do array i
i[0]

// Acessa o 10º float do array f
f[9];
```

Como pode ter percebido com o trecho acima, os elementos de um array são
contados a partir de 0 e não 1. Isso é uma fonte de confusões para vários
programadores iniciantes, então esteja atento.

Arrays são comumente usados para armazenar informações fortemente relacionadas
entre si, por exemplo, coordenadas em um plano 2D podem ser armazenadas em duas
variáveis ou em um array. No segundo caso fica explícito no código que os
valores do array fazem parte de um todo, enquanto o primeiro caso não explicita
nenhuma relação entre as variáveis.

Aqui está um exemplo do armazenamento de coordenadas 2D em duas variáveis:

```c
#include <stdio.h>

int main(void)
{
    int y, x;

    printf("Posição vertical: ");
    scanf("%d", &y);
    printf("Posição horizontal: ");
    scanf("%d", &x);
}
```

E aqui o mesmo código, porém utilizando um array:

```c
#include <stdio.h>

int main(void)
{
    int coords[2];

    printf("Posição vertical: ");
    scanf("%d", &coords[0]);
    printf("Posição horizontal: ");
    scanf("%d", &coords[1]);
}
```

Assim como variáveis comuns, os valores de um array são indefinidos se não forem
inicializados. Podemos inicializar um array com valores entre colchetes:

```c
char c[4] = {'a', 'c', 'j', '2'};

int i[2] = {9 + 5, 2};

float f[3] = {7.5, 1.333, 6.0 / 2};
```

Para alguns arrays, pode ser mais legível dividir seus inicializadores entre
várias linhas:

```c
int i[32] = {5, 9, 2, 1, 8, 0, 2, 5
             2, 2, 1, 3, 5, 6, 7, 5,
             0, 7, 3, 4, 9, 9, 9, 8,
             1, 8, 2, 3, 2, 6, 2, 6};
```

Uma vantagem de usar um inicializador, além de não ter valores indefinidos, é
que o tamanho do array pode ser determinado automaticamente:

```c
int a[]; // Erro: Qual o tamanho do array?

int b[] = {6, 2, 8}; // Ok: O tamanho é 3.
```

Se o inicializador de um array possuir menos valores que o array, os valores
excedentes são inicializados com `0` ou o valor `NULL` (de `<stddef.h>`) de
acordo com seus tipos. Para todos os tipos escalares vistos até agora, o valor é
`0`.

```c
// Todos os valores do array serão 0
int a[50] = {0};
```

Você pode estar se perguntando o que acontece ao tentar acessar, por exemplo, o
décimo elemento em um array de comprimento 9. O comportamento resultante é
indefinido—pode não acontecer nada e pode explodir o planeta.

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310:
  <!-- Tipos escalares/agregados -->
  - 6.2.5 Types
  <!-- Operador [] -->
  - 6.5.2.1 Array subscripting
  <!-- Inicialização de arrays, inicialização padrão de tipos agregados -->
  - 6.7.9 Initialization
