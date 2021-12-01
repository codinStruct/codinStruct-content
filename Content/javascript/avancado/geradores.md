# Geradores

No JavaScript um gerador é uma função que retorna uma lista de valores, só que
um por vez. Para conseguirmos o próximo valor, usamos a função `next()` que
retorna um objeto com o atributo `value` que é o próximo valor e o atributo
`done` que indica se a gerador terminou. Além disso é necessário um asterisco `*`
na frente da função.

Quando um gerador atinge a palavra-chave `yield`, ele pausa e retorna o valor
atual. Na próxima chamada, o gerador continua a partir do local onde parou.

Por exemplo se quisermos criar um gerador de números de 1 a 10, podemos fazer:

```javascript
var contador = function* (n) {
  var numero = 1;
  while (numero <= n) {
    yield numero;
    numero++;
  }
};

var gerador = contador(10);

while (true) {
  var proximo = gerador.next();

  // Verifica se a geração terminou
  if (proximo.done) break;

  console.log(proximo.value);
}
```

Um gerador não necessariamente precisa ter um fim, podemos criar um gerador que
vai gerar números infinitamente:

```javascript
var fibonacci = function* (n) {
  var a = 1,
    b = 1;
  while (true) {
    yield a;
    var temp = a;
    a = b;
    b = temp + b;
  }
};

var gerador = fibonacci();

while (true) {
  var proximo = gerador.next();

  // Verifica se a geração terminou (nunca vai acontecer)
  if (proximo.done) break;

  console.log(proximo.value);
}

// Resultado: 1, 1, 2, 3, 5, 8, 13, ... (infinitamente)
```

Ainda existe a sintaxe `yield*` que serve para chamar um gerador de outro
gerador. Por exemplo:

```javascript
var contador1 = function* (n) {
  var numero = 1;
  while (numero <= n) {
    yield numero;
    numero++;
  }
};

var contador2 = function* (n) {
  var numero = 1;
  while (numero <= n) {
    yield* contador1(numero);
    numero++;
  }
};

var gerador = contador2(4);

while (true) {
  var proximo = gerador.next();

  // Verifica se a geração terminou
  if (proximo.done) break;

  console.log(proximo.value);
}

// Resultado: 1,  1, 2,  1, 2, 3,  1, 2, 3, 4
```

## Referências

- Mozilla Foundation
  ([Generator](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Generator))
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 15.5 Generator Function Definitions
