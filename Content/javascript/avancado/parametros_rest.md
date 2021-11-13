# Parâmetros Rest

Os parâmetros rest são utilizados para passar um número indefinido de argumentos
para uma função e poder acessar esses argumentos dentro da função. Os parâmetros
rest são declarados com o operador `...` e sempre devem ser o último parâmetro
da função. Dentro da função o parametro rest é um array.

Exemplos de uso:

```javascript
// Soma todos os números
function soma(...numeros) {
  return numeros.length ? numeros.reduce((a, b) => a + b) : 0;
}

soma(1, 2, 3, 4, 5);
// Resultado: 15
```

```javascript
// Multiplica todos os números depois do primeiro pelo primeiro número e retorna o array
function multiplicaArray(multiplicador, ...numeros) {
  return numeros.map((numero) => numero * multiplicador);
}

multiplicaArray(2, 1, 2, 3, 4, 5);
// Resultado: [2, 4, 6, 8, 10]
```

## Operador de Espalhamento

Os parâmetros rest podem ser utilizados em conjunto com o operador de
espalhamento (`...`) para passar um array para uma função que aceita parâmetros
rest.

```javascript
// Soma todos os números
function soma(...numeros) {
  return numeros.length ? numeros.reduce((a, b) => a + b) : 0;
}

var array = [1, 2, 3, 4, 5];

soma(...array);
// Resultado: 15
```

## Referências

- Mozilla Foundation
  - [Parâmetros Rest](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Functions/rest_parameters)
  - [Sintaxe de Espalhamento](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/Spread_syntax)
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 15.2 Function Definitions
  - 13.2 Primary Expression
    - 13.2.4 Array Initializer
