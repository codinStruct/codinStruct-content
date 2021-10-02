# Tipos fundamentais básicos

Anteriormente vimos que funções, parâmetros e variáveis podem representar
diferentes tipos de dados. Alguns tipos já estão embutidos como palavras-chave
na linguagem, e serão chamados de **tipos fundamentais**. Esse grupo inclui os
tipos inteiros e os tipos flutuantes, que podem ser vistos abaixo.

## Tipos inteiros

### Tipo `int`

Representa um número inteiro, como `-30` ou `529`. O menor e maior número
representável em um `int` não está definido no padrão C, mas um `int`
representará, no mínimo, qualquer número inteiro no intervalo
[`-32767`,`32767`].

### Tipo `char`

Representa um caractere, como `' '` (espaço em branco), `s` (letra S minúscula)
ou `?` (ponto de interrogação). Os caracteres em C devem estar dentro de aspas
simples; `"a"` não é um caractere, mas `'a'` é.

```c
char bar = 'a'; // Okay

char foo = "a"; // Erro
```

Alguns caracteres não podem ser simplesmente digitados, portanto são
representados utilizando **sequências de escape**, nesse caso uma barra
invertida `\` seguida de um caractere. Na tabela abaixo estão algumas sequências
de escape.

| Sequência | Descrição                          |
| :-------: | :--------------------------------- |
|   `\a`    | Produz um alerta audível ou visual |
|   `\n`    | Produz uma quebra de linha         |
|   `\\'`   | Produz uma aspa simples            |

Tentar armazenar uma aspa simples em um `char` pode ser complicado, pois em
`char ch = ''';` o compilador procura um caractere contido entre o primeiro par
de aspas, porém não há nada dentro. Nesse caso devemos utilizar a sequência de
escape `\'`: `char ch = '\'';`.

```c
char ch = '''; // Erro

char ch = '\''; // Okay
```

Valores `char` são internamente representados por valores inteiros, e o valor de
cada caractere depende do sistema. Muitos programas utilizam o conjunto de
caracteres ASCII, parcialmente mostrado na tabela abaixo.

| Valor | Caractere | Valor | Caractere | Valor | Caractere |
| ----: | :-------- | ----: | :-------- | ----: | :-------- |
|  `32` | (espaço)  |  `65` | A         |  `97` | a         |
|  `48` | 0         |  `66` | B         |  `98` | b         |
|  `49` | 1         |  `67` | C         |  `99` | c         |
|  `50` | 2         |  `68` | D         | `100` | d         |
|  `51` | 3         |  `69` | E         | `101` | e         |
|  `52` | 4         |  `70` | F         | `102` | f         |
|  `53` | 5         |  `71` | G         | `103` | g         |
|  `54` | 6         |  `72` | H         | `104` | h         |
|  `55` | 7         |  `73` | I         | `105` | i         |
|  `56` | 8         |  `74` | J         | `106` | j         |
|  `57` | 9         |  `75` | K         | `107` | k         |

Quando um `char` é convertido para um `int`, o resultado é o valor inteiro que
representa o caractere no conjunto de caracteres utilizado. Quando um `int` é
convertido para `char`, o resultado é o caractere que representa o valor inteiro
no conjunto de caracteres utilizado.

```c
char ch = 65; // ch é igual a 'A' se o conjunto de caracteres for ASCII

int i = 'A'; // i é igual a 65 se o conjunto de caracteres for ASCII
```

### Tipo `_Bool`

É equivalente ao `bool` de outras linguagens de programação, mas possui outro
nome pois esse tipo foi adicionado no padrão C99 e usar o nome `bool` quebraria
vários programas antigos.

Serve para armazenar um de dois valores: verdadeiro ou falso. Aqui está um
exemplo de duas variáveis `_Bool`, com valores que indicam, respectivamente,
verdade e falsidade:

```c
_Bool verdadeiro = 1;
_Bool falso = 0;
```

Utilizar a palavra-chave `_Bool` pode não ser intuitivo. Por conveniência, é
recomendado incluir o arquivo `<stdbool.h>`, que faz com que `bool` se referia a
`_Bool` e permite utilizar as palavras `true` (verdadeiro) e `false` (falso).
Veja o mesmo código que acima porém utilizando `<stdbool.h>`:

```c
bool verdadeiro = true;
bool falso = false;
```

Sempre que `bool`, `true` ou `false` forem utilizados, considere que estamos
usando a diretiva `#include <stdbool.h>` mesmo que em alguns exemplos ela possa
estar omitida por conveniência. É útil lembrar, também, que `true` se refere ao
valor `1` e `false` ao valor `0`.

Um exemplo de uso do `bool` são predicados—termo comum para funções que retornam
verdadeiro ou falso. Suponhamos que a função `Paridade` seja um predicado que
verifica a paridade de um número, retornando `true` caso ele seja par e `false`
caso contrário.

```c
Paridade(1); // false
Paridade(3); // false
Paridade(5); // false

Paridade(2); // true
Paridade(4); // true
Paridade(6); // true
```

Exemplos de predicados existentes na biblioteca padrão são algumas funções do
`<ctype.h>`, como `isalpha` que retorna `true` caso a função receba um caractere
alfabético, como uma letra (o comportamento pode variar conforme a localidade).

```c
isalpha('a'); // true
isalpha('x'); // true
isalpha('L'); // true

isalpha('1'); // false
isalpha(','); // false
isalpha('?'); // false
```

## Tipos flutuantes

### Tipo `double`

Representa um número real, como `-30.52` ou `529.0023`. Ao ser convertido para
um inteiro a parte fracionária é descartada, portanto `15.89` se torna `15`. Se
o valor for alto/baixo demais para ser representado por um `int`, o
comportamento é indefinido.

```c
int i = 15.89; // i é igual a 15
```

## Referências

- Padrão C18 ([ISO/IEC 9899:2018](https://www.iso.org/standard/74528.html)):
  - 5.2 Environmental considerations:
    <!-- Sequências de escape para caracteres não gráficos -->
    - 5.2.2 Character display semantics
    <!-- O tamanho de um int -->
    - 5.2.4.2.1 Sizes of integer types <limits.h>
    <!-- Sequência de escape \' -->
  - 6.4.4.4 Character constants
