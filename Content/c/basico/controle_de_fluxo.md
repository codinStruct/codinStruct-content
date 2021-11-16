# Controle de Fluxo

Até agora vimos programas totalmente lineares, sem mais de um caminho possível.
Nessa página vamos introduzir duas instruções que permitem ao programa decidir,
durante a execução, qual caminho percorrer.

## Instrução `if`

A instrução `if` faz com que o programa execute uma instrução se uma condição
for verdadeira (`true`). A condição deve estar entre parênteses após o `if`, e
após o fechamento dos parênteses deve estar a instrução a ser executada:

```c
       // ⬐ Condição
    if (a > b) // ⬐ Executado se a condição for true (verdadeira)
        puts("a é maior que b");
```

Na maioria dos casos, uma instrução é um trecho de código entre dois `;`. Como o
`if` apenas pode executar uma instrução, o segundo `puts` do código abaixo é
executado incondicionalmente.

```c
    if (a > b) // ⬐ Executada se a condição for true
        puts("a é maior que b");
        puts("Não tenho nada a ver com isso");
//       ⬑ Não faz parte do if, sempre será executada
```

Para que a instrução `puts("Não tenho nada a ver com isso");` faça parte do
`if`, precisamos transformar as duas instruções em uma instrução composta.
Fazemos isso colocando elas entre chaves:

```c
if (a > b)
{ // ← Início da instrução composta
    puts("a é maior que b");
    puts("Agora tenho algo a ver com isso");
} // ← Fim da instrução composta
```

Agora, ambos `puts` só são executados se a condição for verdadeira. Uma
instrução composta pode ser formada por qualquer número de instruções, até mesmo
compostas.

Não é necessário alinhar o código da mesma forma que nos trechos acima. Por
sinal, um programa em C pode ser escrito em uma linha apenas (exceto por
diretivas de pré-processamento). O código abaixo faz exatamente o mesmo que o
código anterior.

```c
if(a>b){puts("a é maior que b");puts("Agora tenho algo a ver com isso");}
```

Por questão de legibilidade, virtualmente todos os programadores optam por
"embelezar" o código com espaços em branco desnecessários. Isso não é algo ruim,
muito pelo contrário.

Vamos modificar um trecho de um programa apresentado anteriormente, que verifica
se os números digitados estão em ordem crescente. O trecho antigo foi comentado:

```c
/* Trecho antigo
printf("Os números estão ordenados? %d\n",
       Ordenados(a, b, c, d, e));
*/

if (Ordenados(a, b, c, d, e))
    puts("Os números estão ordenados.");
```

Agora, em vez de exibir `1` ou `0`, o programa é mais descritivo. Infelizmente,
ele não exibe nada se os números não estiverem ordenados. Para isso existe a
instrução `else`.

## Instrução `else`

A instrução `else` só pode aparecer após uma instrução `if`. Assim como `if`,
`else` condicionalmente executa uma instrução; porém apenas se a condição do
`if` precedente for falsa.

Uma forma simples de visualizar isso é adicionando um `else` em nosso código
anterior:

```c
if (Ordenados(a, b, c, d, e))
    puts("Os números estão ordenados.");
else
    puts("Os números não estão ordenados.");
```

O segundo `puts` só executa se a condição `Ordenados(a, b, c, d, e)` for falsa,
e assim nosso programa finalmente gera saídas apropriadas para ambos os casos.

Um `if` e seu "corpo" (a instrução seguinte) são considerados uma só instrução,
portanto é possível encadear um `if` após um `else`:

```c
if (Ordenados(a, b, c, d, e))
    puts("Os números estão em ordem crescente.");
else if (Ordenados(e, d, c, b, a))
    puts("Os números estão em ordem decrescente.");
else
    puts("Os números não estão ordenados.");
```

Analise com atenção o código acima, pois o uso de condicionais encadeadas é
bastante comum em C. Em português, o funcionamento do programa é o seguinte.

- Se os valores formam uma sequência crescente:
  - Exibe "Os números estão em ordem crescente."
- Caso contrário, se os valores formam uma sequência decrescente:
  - Exibe "Os números estão em ordem decrescente."
- Caso contrário, os valores não estão em ordem crescente ou decrescente.
  - Exibe "Os números não estão ordenados."

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310:
  - 6.8 Statements and blocks:
    <!-- Instruções compostas -->
    - 6.8.2 Compound statement
    <!-- Instruções de expressões (e.g. puts(...);) -->
    - 6.8.3 Expression and null statements
    <!-- Instruções de seleção (if, else). O padrão não deixa super
         claro se else é uma instrução, mas a p.491 dá a entender -->
    - 6.8.4 Selection statements
