# Console

O console JavaScript é uma ferramenta presentes em todos os navegadores modernos, que permite executar comandos de forma rápida e fácil e visualizar o resultado desses comandos. Todos os códigos aqui apresentados podem ser executados no console para fins de teste.

Para acessar o console no Chrome ou no Edge basta apertar a tecla `F12`.

Quando se estiver utilizando o console, você tem acesso ao objeto `console` que é utilizado para executar comandos relacionados aos console em si.

Algumas das aplicações do objeto `console` são:

## `console.log()`

Pode ser usado para exibir o valor de qualquer tipo de dado, incluindo strings, números, objetos, arrays, etc.

```js
console.log('Hello World');
console.log(123);
console.log({ name: 'João', age: 18 });
console.log([1, 2, 3, 4]);

// Resultado exibido no console:
// Hello World
// 123
// { name: 'João', age: 18 }
// [ 1, 2, 3, 4 ]
```

## `console.info()`, `console.warn()`, `console.error()`

Funcionam como `console.log()` mas servem para exibir mensagens de informação, avisos ou erros, respectivamente. O navegador exibe essas mensagens de cores diferentes, dependendo do tipo de mensagem. Além disso é possível escolher o nível de mensagem que será exibida no menu do navegador, de forma que, por exemplo, se escolhermos o nível `error`, apenas mensagens de erro serão exibidas.


## `console.clear()`

É usado para limpar completamente o console. Os comandos que foram executados anteriormente não são apagados mas apenas deixam de ser exibidos.

## `console.time()`

É usado para medir o tempo de execução de um determinado bloco de código entre duas chamadas de `console.time()` e `console.timeEnd()`.

```js
console.time('Timer');

// Código que demora 1 segundo

console.timeEnd('Timer');

// Resultado exibido no console:
// Timer: 1000.0 ms
```

É possível até usar nomes diferentes para os timers, permitindo ter mais de um timer ao mesmo tempo.

```js
console.time('Timer 1');

// Código que demora 1 segundo

console.time('Timer 2');

// Código que demora 1 segundo

console.timeEnd('Timer 1');
console.timeEnd('Timer 2');

// Resultado exibido no console:
// Timer 1: 2000.0 ms
// Timer 2: 1000.0 ms
```

## `console.table()`

É usado para exibir uma tabela com os dados de um objeto.

```js
console.table({ name: 'João', age: 18 });

// Resultado:
// +--------+-------+
// | Índice | Valor |
// +--------+-------+
// | name   | João  |
// | age    | 18    |
// +--------+-------+
```

## `console.count()`

É usado para contar o número de vezes que um determinado comando foi executado.

```js
console.count('Hello World');
console.count('Hello World');
console.count('Hello World');

// Resultado:
// Hello World: 1
// Hello World: 2
// Hello World: 3
```
