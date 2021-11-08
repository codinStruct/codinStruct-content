# Instrução `for`

A instrução de iteração `for` é similar à `while`, porém além de uma condição
várias funcionalidades podem ser embutidas entre os parênteses. Entre os
parênteses, podemos especificar **três** coisas:

1. Uma ação inicial (e.g. declaração e/ou inicialização de variáveis).
2. Uma condição (assim como no `while`).
3. Uma ação intermediária (ocorre após cada iteração).

As expressões (ou, no caso de 1., declaração) devem ser separadas por ponto e
vírgula. Vamos fazer um laço que conta de 0 a 10 com um `for`, utilizando suas
três partes e um _loop body_:

1. A definição e inicialização `int i = 0`.
2. A condição `i <= 10`.
3. O incremento `i = i + 1`.
4. O _loop body_ que imprime o valor de `i`.

Isso é expresso da seguinte forma:

```c
//        ⬐ Definição      ⬐ Incremento
for (int i = 0; i <= 10; i = i + 1)
//                 ⬑ Condição
    printf("%d\n", i); // ← Loop body
```

Variáveis declaradas no `for` são temporárias, ou seja, só podem ser acessadas
entre os parênteses e dentro do _loop body_.

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310:
  - 6.8.5 Iteration statements
