# Gerenciamento de Memória

Até agora não vimos gerenciamento manual de memória, apenas automático. Todas
variáveis `auto` que criamos são destruídas automaticamente quando saem do
escopo onde foram declaradas. A duração estática de armazenamento evita essa
destruição, porém o objeto estático é compartilhado entre todas chamadas da
função e persiste durante toda a execução programa. Para ter controle total da
duração de um objeto na memória, é necessário utilizar as funções de
gerenciamento de memória `malloc` e `free`, de `<stdlib.h>`.

## Função `malloc`

A função `malloc` recebe a quantidade de bytes a serem alocados e retorna um
ponteiro que se refere à memória alocada. Isso significa que para alocar e
utilizar um `int`, basta fazer `int *p = malloc(sizeof *p);` ou
`int *p = malloc(sizeof(int));`. Todas as indireções no ponteiro acessarão o
objeto alocado.

```c
int *AlocarInt(void)
{
    return malloc(sizeof(int));
}

int main(void)
{
    int *a = alocarInt(),
        *b = alocarInt(),
        *c = alocarInt();

    *a = 1;
    *b = 2;
    *c = 3;

    // Exibe "1, 2, 3"
    printf("%d, %d, %d\n",
           *a, *b, *c);

    return 0;
}
```

Funções em C não podem retornar arrays mas podem retornar ponteiros. Assim, uma
forma de simular o retorno de array é alocar um array com `malloc` e retornar um
ponteiro para ele. Como exemplo, vejamos uma função abaixo.

```c
// Retorna um  array de qtd ints com valor val
int *FabricarArray(size_t qtd, int val)
{
    int *array = malloc(sizeof(int[qtd]));

    for (size_t i = 0; i < qtd; i = i + 1)
        array[i] = val;

    return array;
}

int main(void)
{
    int *array = FabricarArray(9, 5);

    // Exibirá "5 5 5 5 5 5 5 5 5 "
    for (size_t i = 0; i < 9; i = i + 1)
        printf("%d ", array[i]);

    return 0;
}
```

Lembre-se que embora um ponteiro suporte o operador `[]` e simule um array, ele
não é _exatamente_ um array. O operador `sizeof` na variável `array` do código
acima não resulta no tamanho do array retornado pela função e sim no tamanho do
ponteiro.

```c
int array[100];
int *ponteiro = FabricarArray(100, 0);

printf("sizeof array: %zu\nsizeof ponteiro: %zu\n",
        sizeof array, sizeof ponteiro);
```

Em um sistema específico, a execução do código acima exibiu `sizeof array: 400`
e `sizeof ponteiro: 8`, embora ambos possam acessar 100 `int`s com o operador
`[]`.

## Função `free`

Toda a memória alocada por `malloc` continua alocada até ser manualmente
liberada. Isso é feito aplicando a função `free` ao ponteiro que foi retornado
por `malloc`. O ponteiro retornado pela nossa função `FabricarArray` é alocado
por `malloc` portanto esse procedimento deve ser feito.

```c
int main(void)
{
    int *array = FabricarArray(9, 5);

    /* Utilizar o array ... */

    free(array);

    return 0;
}
```

Após o `free`, acessar o ponteiro com `*` resulta em comportamento indefinido
até que um novo alvo válido seja dado a ele.

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310:
  <!-- Função free -->
  - 7.22.3.3 The free function
