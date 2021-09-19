# Conversões implícitas

Os tipos inteiros são claramente diferentes dos tipos de ponto flutuante. Essa
diferença não se dá somente nos valores que os objetos podem assumir, mas também
na representação deles na memória.

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

Esse é o efeito das conversões implícitas no C. Veja bem: para não haver
resultados inesperados, o compilador gera código que converte o valor em ponto
flutuante para um tipo inteiro mesmo que as representações não batam. Isso
significa que ao executar `i = f`, a memória não é apenas copiada mas também
convertida na atribuição.

O processo de conversão implícita segue várias regras bem estabelecidas no
padrão C ISO:

<!-- TODO: Colocar as regras aqui -->

<!-- TODO: Explicar como usar casts para evitar conversões implícitas -->

## Exercícios

1. Exiba as memórias de um `int` e um `float` com o mesmo valor e verifique se
   há alguma diferença.
1. Copie a memória de um `int` com valor 5 para um `float`, sem conversões,
   utilizando um cast. Exiba as memórias assim como no exercício anterior.

## Referências

- Padrão C18 ([ISO/IEC 9899:2018](https://www.iso.org/standard/74528.html)):
  - 6.2.5 Types
  - 6.2.6 Representations of types
  - 6.3 Conversions
