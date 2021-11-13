# Funções Arrow

Funções arrow foram introduzidas em ES6, para ser uma maneira mais simples de criar funções com poucos parâmetros, lógica simples e que retornam um valor. Por causa disso elas são ideais para quando se precisa de uma função de *callback*.

O exemplo mais simples de uma função arrow é:

```js
var soma = (a, b) => { return a + b };

soma(1, 2);
// Resultado: 3
```

Se a função possuir apenas um parâmetro, o parênteses podem ser omitidos:

```js
var quadrado = a => { return a * a };

quadrado(2);
// Resultado: 4
```

Se a função for composta apenas do retorno, sem nenhum operação adicional, pode-se omitir as chaves e a palavra `return`:

```js
var quadrado = a => a * a;

quadrado(5);
// Resultado: 25
```

## Outros Exemplos

```js
// Funções simples
var maximo = (a, b) => a > b ? a : b;

// Funções sem parâmetros
setTimeout(() => console.log("Hello World"), 1000);

// Callbacks
[1, 2, 3, 4, 5].reduce((total, valorAtual) => total + valorAtual);
```

## Referências

- Mozilla Foundation ([Arrow Functions](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Functions/Arrow_functions))
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 15.3 Arrow Function Definitions
