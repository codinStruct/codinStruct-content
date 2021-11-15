# Arrays

Em JavaScript os arrays são estruturas de dados do tipo lista que armazenam
vários valores em uma única variável. Os arrays não tem um tamanho fixo, assim o
número de elementos que podem ser armazenados é dinâmico. Além disso os arrays
podem armazenar qualquer tipo de dado, inclusive armazenar outros arrays e
valores de tipos diferentes ao mesmo tempo.

Para criar um array vazio em JavaScript basta declarar uma variável com o valor
igual a `[]`. Podemos até preenchê-lo com valores iniciais usando a vírgula para
separar cada item. Eis um exemplo:

```javascript
// Cria um array vazio
var array1 = [];

// Cria um array com valores iniciais
var array2 = [1, "string", false];
```

Para acessar os elementos de um array basta usar o índice do elemento (isso
serve para tanto escrita e leitura). O índice começa em 0 e vai até o tamanho do
array menos 1. Assim se quisermos acessar o primeiro elemento de um array basta
usarmos o índice 0, se quisermos acessar o segundo elemento basta usar o índice
1 e assim por diante. A sintaxe para acessar um valor em um array é a seguinte:

```javascript
var array = [1, 2, 3];

console.log(array[0]); // Resultado: 1
console.log(array[1]); // Resultado: 2
console.log(array[2]); // Resultado: 3

// Altera o valor do primeiro elemento do array
array[0] = "string";

console.log(array[0]); // Resultado: "string"
console.log(array[1]); // Resultado: 2
console.log(array[2]); // Resultado: 3
```

Se quisermos acessar o comprimento de um array basta acessar a propriedade
`length` do array. Essa propriedade pode ser sobrescrita, mas não é recomendado.
Caso a propriedade `length` sobrescrita for maior que o comprimento do array, o
array será preenchido com espaços vazios. Caso a propriedade `length`
sobrescrita for menor que o comprimento do array, os elementos a mais serão
removidos.

```javascript
var array = [1, 2, 3];

console.log(array.length); // Resultado: 3

array.length = 5;

console.log(array); // Resultado: [1, 2, 3, , ]

array.length = 2;

console.log(array); // Resultado: [1, 2]
```

## Métodos Comuns

### `push()`

Adiciona um elemento no final do array.

```javascript
var array = [1, 2, 3];

array.push(4, 5);

console.log(array); // Resultado: [1, 2, 3, 4, 5]
```

### `pop()`

Remove o último elemento do array, retornando o último valor.

```javascript
var array = [1, 2, 3];

var ultimo = array.pop();

console.log(array); // Resultado: [1, 2]
console.log(ultimo); // Resultado: 3
```

### `shift()`

Remove o primeiro elemento do array, retornando o primeiro valor.

```javascript
var array = [1, 2, 3];

var primeiro = array.shift();

console.log(array); // Resultado: [2, 3]
console.log(primeiro); // Resultado: 1
```

### `unshift()`

Adiciona um elemento no início do array.

```javascript
var array = [1, 2, 3];

array.unshift(4, 5);

console.log(array); // Resultado: [4, 5, 1, 2, 3]
```

### `splice()`

Remove ou adiciona em qualquer posição do array. Pode remover 1 ou mais
elementos e retorna outro array com os elementos removidos. Além disso ele pode
adicionar elementos no array. Esse método altera o array original.

O primeiro número passado à função é a posição do elemento que será removido. O
segundo número passado é o número de elementos que serão removidos. Se não for
passado um segundo número, todos os elementos a partir da posição passada serão
removidos. Parâmetros adicionais são os elementos que serão adicionados no
array.

```javascript
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

console.log(array); // Resultado: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// Remove o segundo elemento
array.splice(1, 1);

console.log(array); // Resultado: [1, 3, 4, 5, 6, 7, 8, 9, 10]

// Remove o terceiro e o quarto elemento
array.splice(2, 2);

console.log(array); // Resultado: [1, 3, 6, 7, 8, 9, 10]

// Remove todos os elementos a partir do sexto elemento
array.splice(5);

console.log(array); // Resultado: [1, 3, 6, 7, 8]

// Adiciona dois elementos após o terceiro elemento
array.splice(3, 0, 11, 12);

console.log(array); // Resultado: [1, 3, 6, 11, 12, 7, 8]
```

### `slice()`

Retorna um novo array com os elementos do array original. O primeiro número
passado à função é a posição do primeiro elemento que será retornado. O segundo
número passado é a posição do último elemento que será retornado. Esse método
não altera o array original.

```javascript
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

console.log(array.slice(0, 5)); // Resultado: [1, 2, 3, 4, 5]
console.log(array.slice(5)); // Resultado: [6, 7, 8, 9, 10]
```

### `indexOf()`

Encontra o índice do primeiro elemento do array que é igual ao valor passado.

```javascript
var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

console.log(array.indexOf(5)); // Resultado: 4
```

### `sort()`

Ordena os elementos do array usando a função de comparação passada como
parâmetro. A função de comparação deve conter dois parâmetros e retornar um
número negativo, zero ou positivo dependendo do que o primeiro parâmetro seja
menor, igual ou maior que o segundo parâmetro, respectivamente.

```javascript
var array = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];

// Ordenação crescente
array.sort((a, b) => a - b);

console.log(array); // Resultado: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

### `forEach()`

Executa uma função de callback para cada elemento do array. A função
opcionalmente pode ter como parâmetro o elemento atual, o índice do elemento e o
próprio array.

```javascript
var array = [1, 2, 3];

array.forEach((elemento, indice, array) => {
  console.log(elemento); // Resultado: 1, 2, 3
  console.log(indice); // Resultado: 0, 1, 2
  console.log(array); // Resultado: [1, 2, 3], [1, 2, 3], [1, 2, 3]
});
```

## Referências

- Mozilla Foundation
  ([Array](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array))
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 23.1 Array Objects
