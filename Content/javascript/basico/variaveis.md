# Variáveis

Javascript é uma linguagem tipada dinamicamente, ou seja, embora haja as variáveis terem um tipo de dados associada a seu valor, as variáveis em si podem guardar qualquer tipo sem a necessidade de especificar um tipo àquela variável.

As regras para nomear uma variável são as seguintes:

- Só pode conter letras, números ou `_` e `$`;
- Deve começar com `_`, `$` ou uma letra;
- Uma capitalização diferente gera uma variável diferente (sensível à capitalização)
- Letras do ISO 8859-1, como `ü` e `è` também pode ser utilizados
- Não pode ser uma palavra reservada da linguagem (`var`, `function`, `if`, etc)

Para se declarar uma variável pode-se utilizar a palavra chave `var` e a variável pode opcionalmente ser definida na declaração ou mais à frente no código.

Exemplos de declaração de variáveis podem ser:

```javascript
var _underline;
var base2;
var $;
var Variável;
```

Exemplos de declaração de variáveis que geram um erro:

```javascript
var 1lugar;
var #teamseas;
var duas partes;
var function;
```

## Referências

- Mozilla Foundation ([Grammar and types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Grammar_and_Types))
- Ecma International ([ECMA-262](https://tc39.es/ecma262/#sec-identifier-names))
  - 12.6 Names and Keywords
  - 14.3 Declarations and the Variable Statement
    - 14.3.2 Variable Statement
