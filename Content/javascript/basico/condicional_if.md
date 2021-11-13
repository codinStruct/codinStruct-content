# Condicional If

O condicional `if` é usado para desviar o fluxo do programa dependendo de uma condição. Isso permite que o programa execute uma parte do código, caso a condição seja verdadeira, e outra parte do código, caso a condição seja falsa.

A forma mais simples do condicional `if` contém apenas um bloco de código:

```javascript
if (condição) {
    // código que será executado caso a condição seja verdadeira
}
```

O condicional ainda pode vir acompanhado da palavra chave `else` e de um bloco de código que será executado caso a condição seja falsa:

```javascript
if (condição) {
    // código que será executado caso a condição seja verdadeira
} else {
    // código que será executado caso a condição seja falsa
}
```

É possível ainda conectar dois condicionais para criar uma estrutura de decisão mais complexa:

```javascript
if (condição1) {
    // código que será executado caso a condição1 seja verdadeira
} else if (condição2) {
    // código que será executado caso a condição1 seja falsa e condição2 seja verdadeira
} else {
    // código que será executado caso as duas condições sejam falsas
}
```

## Exemplos

```javascript
var debug = true;

if (debug) {
    console.log("Debugando...");
}

// Resultado: "Debugando..."
```

```javascript
var grande = true;
var pesado = true;

if (grande && pesado) {
    console.log("Grande e pesado!");
} else if (grande) {
    console.log("Grande!");
} else if (pesado) {
    console.log("Pesado!");
} else {
    console.log("Não é grande nem pesado!");
}

// Resultado: "Grande e pesado!"
```

```javascript
function compararValores(valor1, valor2) {
    if (valor1 > valor2) {
        return "Maior";
    } else if (valor1 < valor2) {
        return "Menor";
    } else {
        return "Iguais";
    }
}

compararValores(10, 20);
// Resultado: "Menor"

compararValores(20, 10);
// Resultado: "Maior"

compararValores(10, 10);
// Resultado: "Iguais"
```

## Referências

- Mozilla Foundation ([if...else](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/if...else))
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 14.6 The if Statement
