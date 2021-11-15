# For Loop

O for loop é uma estrutura de repetição que executa um bloco de código um
determinado número de vezes baseado em uma condição. Em JavaScript, o for loop é
implementado com a palavra-chave `for` e contém 3 variantes: O `for`, o `for in`
e o `for of`.

## For

O for loop simples é composto por 4 partes:

```javascript
for (inicialização; condição; expressão) {
  declaração;
}
```

- `inicialização`: é o que será executado apenas uma vez no início de cada loop.
- `condição`: é a condição que será avaliada para verificar se o loop deve
  continuar ou não.
- `expressão`: é o que será executado após cada iteração do loop.
- `declaração`: é o que será executado em cada iteração do loop.

Um exemplo de como se pode utilizar um for loop para iterar sobre um array:

```javascript
var array = [1, 2, 3, 4, 5];

for (var i = 0; i < array.length; i++) {
  console.log(array[i]);
}

// Resultado:
// 1, 2, 3, 4, 5
```

O que está acontecendo aqui é que o `for` inicializa a variável `i` com o valor
0, e a condição é verificada enquanto `i` seja menor que o tamanho do array. No
exemplo acima, o loop será executado 5 vezes, sendo que cada iteração irá
imprimir o valor de `array[i]`. Somente quando o valor de `i` atingir o tamanho
do array, o loop será finalizado.

No for loop todas as partes são opcionais, mas é importante saber que caso a
condição não exista o loop será executado infinitamente, a menos que se utilize
a palavra-chave `break`.

Outros exemplos:

```javascript
var i = 0;

for (; i < 5; ) {
  console.log(i++); // Resultado: 0, 1, 2, 3, 4
}

for (;;) {
  console.log(1); // Resultado: 1, 1, 1, 1, 1, 1, ... (infinitamente)
}
```

## For Of

O for of é uma forma de iterar sobre qualquer objeto iterável, como um array ou
string.

```javascript
var array = [1, 2, 3, 4, 5];
var string = "Hello World";
var objeto = {
  nome: "João",
  sobrenome: "Silva",
};

for (var item of array) {
  console.log(item); // Resultado: 1, 2, 3, 4, 5
}

for (var char of string) {
  console.log(char); // Resultado: H, e, l, l, o, , W, o, r, l, d
}
```

## For In

O for in é uma forma de iterar sobre as propriedades de um objeto. A iteração é
feita na ordem em que as propriedades aparecem no objeto.

```javascript
var objeto = {
  nome: "João",
  sobrenome: "Silva",
};

for (var propriedade in objeto) {
  console.log(propriedade + " => " + objeto[propriedade]);
}

// Resultado:
// nome => João
// sobrenome => Silva
```

## Referências

- Mozilla Foundation
  - [for](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/for)
  - [for of](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/for...of)
  - [for in](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/for...in)
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 14.7 Iteration Statements
    - 14.7.4 The for Statement
    - 14.7.5 The for-in, for-of, and for-await-of Statements
