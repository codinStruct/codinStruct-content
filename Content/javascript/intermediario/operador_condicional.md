# Operador Condicional (Ternário)

O operador é basicamente uma forma abreviada de uma expressão condicional,
exceto que ela retorna um valor dependendo da condição. A sintaxe básica desse
operador é:

```javascript
resultado = condicao ? valor_se_verdadeiro : valor_se_falso;
```

Quando esse operador é chamado, primeiro é analisado a condição, e se o
resultado for verdadeiro a expressão `valor_se_verdadeiro` é calculada e
retornada, senão a expressão `valor_se_falso` é calculada e retornada.

Esse operador também é comumente chamado como **ternário**, pois é formado por
três partes.

## Exemplos

Em funções que retornam um valor dependendo de uma condição:

```javascript
function maximo(a, b) {
  // Se a for maior que b, retorna a, senão retorna b
  return a > b ? a : b;
}

maximo(10, 20); // Resultado: 20
maximo(20, 10); // Resultado: 20
```

Em conjunto para simular um _if/else if/else_ ou um _switch/case_:

```javascript
var numero = 2;

var texto = numero == 1 ? "um" : numero == 2 ? "dois" : "outro";

texto;
// Resultado: "dois"
```

## Referências

- Mozilla Foundation
  ([Operador Condicional Ternário](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/Conditional_Operator))
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 13.14 Conditional Operator ( ? : )
