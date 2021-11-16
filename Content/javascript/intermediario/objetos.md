# Objetos

JavaScript é uma linguagem de programação que suporta o paradigma de programação
orientada a objetos, portanto é, possível criar objetos e manipular seus
atributos e métodos. Um objeto simples é representado por uma série de chaves e
valores, onde o nome da chave é o nome do atributo e o valor é o valor do
atributo. É possível criar objetos com atributos de qualquer tipo, inclusive de
arrays, outros objetos e funções (chamadas de métodos).

Para criar um objeto pode ser usar o comando `new Object()` ou ainda `{}` e usar
`:` para criar o objeto com atributos já definidos.

```javascript
var objeto1 = new Object();
var objeto2 = {};
var objeto3 = {
  atributo1: "valor1",
  atributo2: "valor2",
};
```

## Acessando Atributos

É possível adicionar atributos a um objeto usando o operador `.` e o nome do
atributo. Usando o mesmo operador é possível alterar o valor do atributo. As
regras para o nome dos atributos são as mesmas que para os nomes de variáveis.

```javascript
var carro = {};

carro.cor = "vermelho";
carro.portas = 4;
carro.ligado = true;
carro.buzinar = function () {
  console.log("Beep!");
};

console.log(carro.cor); // vermelho
console.log(carro.portas); // 4
console.log(carro.ligado); // true
carro.buzinar(); // Beep!
```

Outra maneira de acessar os atributos de um objeto é usando o operador `[]` e o
nome do atributo na forma de uma string. Por causa disso também é possível
associar qualquer tipo de dados que possa ser convertido em string a um
atributo. Entretanto, vale notar que o valor que realmente será armazenado no
objeto será o valor convertido para string.

```javascript
var carro = {
  cor: "vermelho",
  portas: 4,
  ligado: true,
};

carro["cor"] = "azul";

console.log(carro.cor); // azul

carro[0] = "valor";

console.log(carro[0]); // valor
console.log(carro["0"]); // valor
```

Para deletar um atributo de um objeto é possível usar o operador `delete` e o
nome do atributo.

```javascript
var carro = {
  cor: "vermelho",
  portas: 4,
  ligado: true,
};

console.log(carro.cor); // vermelho

delete carro.cor;

console.log(carro.cor); // undefined
```

## Comparação entre Objetos

Objetos são únicos e dessa forma uma comparação entre objetos só será verdadeira
se eles forem o mesmo objeto, mesmo que tenham os mesmos atributos e valores.
Assim uma atribuição de variável para outra variável que guarda um objeto é
considerada uma atribuição de referência.

```javascript
var carro1 = {
  cor: "vermelho",
  portas: 4,
  ligado: true,
};

var carro2 = {
  cor: "vermelho",
  portas: 4,
  ligado: true,
};

var carro3 = carro1;

console.log(carro1 == carro2); // false
console.log(carro1 == carro3); // true
```

## Funções Construtoras

Se quisermos utilizar um mesmo modelo de objeto para criar vários objetos
similares é possível usar funções construtoras que retornam um objeto com os
atributos definidos e do tipo definido pela função construtora.

Quando utilizamos uma função construtora, é preciso utilizar a palavra-chave
`this` para definir os atributos do objeto e a palavra-chave `new` para criar o
objeto.

---

_**É muito importante perceber que a função construtora não é uma classe, apesar
de funcionar de maneira semelhante.**_

---

```javascript
// É de costume que o nome da função construtora comece com letra maiúscula
function Carro(cor, portas, ligado) {
  this.cor = cor;
  this.portas = portas;
  this.ligado = ligado;
  this.buzinar = function () {
    console.log("Beep!");
  };
}

var carro1 = new Carro("vermelho", 4, true);
var carro2 = new Carro("azul", 2, false);

console.log(carro1); // Carro { cor: 'vermelho', portas: 4, ligado: true, buzinar: [Function] }
console.log(carro2); // Carro { cor: 'azul', portas: 2, ligado: false, buzinar: [Function] }
```

## Referências

- Mozilla Foundation
  ([Trabalhando com objetos](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Guide/Trabalhando_com_objetos))
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 20.1 Object Objects
