# Instrução `for`

A instrução de iteração `for` é similar à `while`, porém além de uma condição
várias funcionalidades podem ser embutidas entre os parênteses. Entre os
parênteses, podemos especificar **três** coisas:

1. Uma ação inicial (e.g. definição e/ou inicialização de variáveis).
2. Uma condição (assim como no `while`).
3. Uma ação intermediária (ocorre após cada iteração).

As expressões (ou, no caso de 1., definição) devem ser separadas por ponto e
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

Anteriormente, fizemos a soma dos valores de um array utilizando a instrução
`while`. Vamos refazê-la, mas dessa ver usando `for`:

```c
int array[5] = {10, 5, 3, 5, 2};
int soma = 0;

for (int i = 0; i < 5; i = i + 1)
    soma = soma + array[i];
```

Qualquer uma das três partes entre os parênteses de um `for` pode ser omitida.
Caso a condição seja omitida, ela é substituída por alguma expressão `true`.
Portanto o seguinte `for` executa interminavelmente:

```c
for (;;) // Equivalente a while (true)
    puts("*");
```

O _loop body_ de um `for` ou `while` pode ser uma instrução nula, i.e. um
simples `;`. Dessa forma, toda a lógica de um laço simples pode ser especificada
entre os parênteses da instrução:

```c
int array[5] = {10, 5, 3, 5, 2};
int soma = 0;

for (int i = 0; i < 5; soma = soma + array[i], i = i + 1);
```

Isso soma os elementos do array assim como anteriormente, porém com _loop body_
nulo. Você pode ter percebido o uso da vírgula entre `soma = soma + array[i]` e
`i = i + 1`; o operador `,` (simplesmente "vírgula") é usado para compor uma
expressão a partir de duas, portanto `soma = soma + array[i], i = i + 1` é
considerada uma só expressão e assim pode ser utilizada no `for`. Na maioria dos
casos, fazer toda a lógica de um laço entre os parênteses piora a legibilidade
do código; faça apenas quando a concisão do código for crucial.

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310:
  - 6.5.17 Comma operator
  - 6.8.5 Iteration statements
