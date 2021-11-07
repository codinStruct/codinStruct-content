# Funções

Em JavaScript funções são blocos de códigos que podem ser reutilizados quantas vezes quisermos para executar a mesma tarefa repetidas vezes.

Existem dois conceitos sobre funções que é necessário entender: Parâmetros e Retorno. Uma função pode receber parâmetros quando for chamada e utilizar esses valores dentro do seu corpo. Uma função também pode retornar um valor que poderá ser utilizado em nosso programa.

Como exemplo de função, vamos criar uma função que recebe um número e retorna o dobro desse número. A função terá um parâmetro `n` que será o número que será passado para a função e um retorno que será o dobro de `n`:

```javascript
var numero = 3;

function dobro(n) {
  return n * 2;
}

var b = dobro(numero); // b agora é 6
```

É importante notar o uso de parênteses no final da função. Isso é necessário para que o JavaScript entenda que a função é um comando e não uma atribuição:

```javascript
function tres() {
  return 3;
}

var a = tres(); // a agora é 3
var b = tres; // b agora é a função tres
```

Outra coisa a se notar é que o parametro `n` é apenas uma cópia da variável `numero`. Quando a função é chamada, o valor da variável `numero` não é alterado:

```javascript
var numero = 3;

function quatro(n) {
  n = 4;
}

quatro(numero);

numero; // numero continua com o valor 3
```

Se quisermos alterar o valor de `numero` dentro da função, devemos acessar a variável diretamente:

```javascript
var numero = 3;

function quatro() {
  numero = 4;
}

quatro();

numero; // numero agora é 4
```

- Ecma International ([ECMA-262](https://tc39.es/ecma262/#sec-identifier-names))
  - 15.2 Function Definitions
