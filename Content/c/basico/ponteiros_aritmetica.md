# Aritmética de Ponteiros

Embora possa parecer estranho à primeira vista, ponteiros (exceto `void *`)
suportam soma e subtração. Para entender o funcionamento, é necessário primeiro
compreender como arrays são armazenados na memória.

## Somando e Subtraindo Inteiros

Imaginemos um array de `char`s `{'a', 'f', 'c', 'k', 'b'}`. O array seria
disposto na memória como na tabela abaixo. Cada endereço se refere a um byte.

| Endereço | Valor |
| -------- | ----- |
| X        | `'a'` |
| X + 1    | `'f'` |
| X + 2    | `'c'` |
| X + 3    | `'k'` |
| X + 4    | `'b'` |

---

Para facilitar a compreensão, estamos supondo que um `int` possui 4 bytes em
qualquer sistema.

---

No caso de um array `int arr[] = {10, 5, 9, 2, 1};` com `int`s de 4 bytes, o
array seria disposto como na tabela abaixo.

| Endereço | Valor |
| -------- | ----- |
| X        | `10`  |
| X + 4    | `5`   |
| X + 8    | `9`   |
| X + 12   | `2`   |
| X + 16   | `1`   |

Perceba que os elementos são contíguos na memória, i.e. um vem imediatamente
após o outro. Na tabela acima `10` ocupa X até X + 3, `5` ocupa X + 4 até X + 7,
`9` ocupa X + 8 até X + 11, etc. Isso significa que se um ponteiro aponta para o
endereço de `10`, esse **endereço** somado com 4 (`sizeof(int)`) será o endereço
de `5`.

Dado o ponteiro `Tipo *p = X`, `p + 1` se refere a `X + sizeof(Tipo)`. Isso
significa que dado `int *p = &arr[0]`, `p + 1` referencia `arr[1]`. e `p + 2`
referencia `arr[2]`. Ou seja, somar `1` a `p` na verdade incrementa o endereço
em 4. Subtração funciona da mesma forma: Dado `int *p = &arr[2]`, `p - 2`
referencia `arr[0]`.

Voltemos para a tabela acima. Um ponteiro para X, somado com 1 apontará para X +
4 e somado com 2 apontará para X + 8. Isso pode parecer contraintuitivo a
princípio, porém é conveniente: Para acessar o próximo elemento contíguo basta
somar 1 ao ponteiro independentemente de seu tipo.

```c
int arr[] = {0, 0, 9, 0, 0};

int *p = &arr[1];

*p = 10;

p = p + 2; // p agora se refere a arr[3]
*p = 8;

p = p + 1; // p agora se refere a arr[4]
*p = 7;

p = p - 4; // p agora se refere a arr[0]
*p = 11;

```

Após a execução do código acima, os elementos de `arr` serão `11, 10, 9, 8, 7`.

## Subtraindo Ponteiros

Embora inteiros possam ser somados a ponteiros, ponteiros não. Já a subtração
entre ponteiros é possível quando ambos ponteiros referenciam elementos do mesmo
array (ou a posição logo após o final do array), e resulta na diferença entre os
índices dos elementos apontados. O resultado é do tipo `ptrdiff_t` de
`<stddef.h>`, que é um inteiro com sinal. Veja abaixo, lembrando que o resultado
do operador unário `&` é um ponteiro.

```c
int arr[50];

// A especificação %td serve para ptrdiff_t
printf("%td\n", &arr[10] - &arr[20]); // Exibe "-10" (10 - 20)
printf("%td\n", &arr[25] - &arr[20]); // Exibe "5"   (25 - 20)

int *p = &arr[10] + 20;
printf("%td\n", p - &arr[10]); // Exibe "20" (30 - 10)
```

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310:
  <!-- Operações aritméticas em ponteiros -->
  - 6.5.6 Additive operators
  <!-- Tipo ptrdiff_t -->
  - 7.19 Common definitions <stddef.h>
  <!-- Especificação %td -->
  - 7.21.6.1 The fprintf function
