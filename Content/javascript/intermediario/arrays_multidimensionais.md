# Arrays Multidimensionais

Um array pode conter qualquer tipo de dados, inclusive outros arrays. Assim é
possível criar arrays multidimensionais, onde cada elemento do array pode ser um
array. Nesse caso para acessar qualquer elemento dessa estrutura é necessário
usar um índice para cada dimensão do array multidimensional. Ná prática a
maioria dos arrays multidimensionais contém apenas 2 dimensões, sendo necessário
usar apenas 2 índices para acessar cada elemento.

Um exemplo utilizando um array que guarda o tabuleiro do jogo da velha:

```javascript
var tabuleiro = [
  [" ", " ", " "],
  [" ", " ", " "],
  [" ", " ", " "],
];

console.table(tabuleiro);
//     +---+---+---+
//     | 0 | 1 | 2 |
// +---+---+---+---+
// | 0 |   |   |   |
// +---+---+---+---+
// | 1 |   |   |   |
// +---+---+---+---+
// | 2 |   |   |   |
// +---+---+---+---+

tabuleiro[0][0] = "X";

console.table(tabuleiro);
//     +---+---+---+
//     | 0 | 1 | 2 |
// +---+---+---+---+
// | 0 | X |   |   |
// +---+---+---+---+
// | 1 |   |   |   |
// +---+---+---+---+
// | 2 |   |   |   |
// +---+---+---+---+

tabuleiro[1][1] = "O";

console.table(tabuleiro);
//     +---+---+---+
//     | 0 | 1 | 2 |
// +---+---+---+---+
// | 0 | X |   |   |
// +---+---+---+---+
// | 1 |   | O |   |
// +---+---+---+---+
// | 2 |   |   |   |
// +---+---+---+---+
```

Se quisermos criar um array bidimensional dinamicamente usamos o for loop:

```javascript
var tabuleiro = [];

for (var i = 0; i < 3; i++) {
  // Cria um array dentro do array principal
  tabuleiro[i] = [];

  for (var j = 0; j < 3; j++) {
    // Insere um elemento dentro do array criado
    tabuleiro[i][j] = " ";
  }
}

console.table(tabuleiro);
//     +---+---+---+
//     | 0 | 1 | 2 |
// +---+---+---+---+
// | 0 |   |   |   |
// +---+---+---+---+
// | 1 |   |   |   |
// +---+---+---+---+
// | 2 |   |   |   |
// +---+---+---+---+
```

Um dos usos mais comuns do array multidimensional é guardar dados de uma tabela
de dados. Por exemplo, se quiser guardar uma lista que contenha o nome de cada
jogador e sua pontuação, podemos criar um array multidimensional como:

```javascript
var jogadores = [
  ["Jogador 1", 100],
  ["Jogador 2", 90],
  ["Jogador 3", 80],
  ["Jogador 4", 70],
  ["Jogador 5", 60],
];

console.table(jogadores);
//     +-----------+----+
//     | 0         | 1  |
// +---+-----------+----+
// | 0 | Jogador 1 | 100|
// +---+-----------+----+
// | 1 | Jogador 2 | 90 |
// +---+-----------+----+
// | 2 | Jogador 3 | 80 |
// +---+-----------+----+
// | 3 | Jogador 4 | 70 |
// +---+-----------+----+
// | 4 | Jogador 5 | 60 |
// +---+-----------+----+
```

## Referências

- Mozilla Foundation
  ([Array](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array))
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 23.1 Array Objects
