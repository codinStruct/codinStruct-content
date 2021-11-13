# Condicional Switch

O condicional `switch` (também conhecido como _Switch/Case_) é uma estrutura de
decisão que permite que você escolha entre várias opções de acordo com o valor
de uma expressão. Ele contém um bloco de código dividido em vários `case` que
são testados para igualdade com o valor da expressão.

Ele é muito parecido com o condicional `if`, porém, ele não possui uma condição
de parada em cada `case`, sendo necessário o uso do comando `break`.

Existe támbem o comando `default` que é executado quando nenhum dos `case` é
igual ao valor da expressão.

Exemplo da estrutura do condicional `switch`:

```javascript
switch (valor) {
  case opcao1:
    // Executa o código quando o valor da expressão for igual a opcao1
    break;
  case opcao2:
    // Executa o código quando o valor da expressão for igual a opcao2
    break;
  default:
    // Executa o código quando nenhuma das opções for igual ao valor da expressão
    break;
}
```

## Exemplo

```javascript
var dia = "quinta";

switch (dia) {
  case "segunda":
    console.log("Hoje é segunda-feira");
    break;
  case "terça":
    console.log("Hoje é terça-feira");
    break;
  case "quarta":
    console.log("Hoje é quarta-feira");
    break;
  case "quinta":
    console.log("Hoje é quinta-feira");
    break;
  case "sexta":
    console.log("Hoje é sexta-feira");
    break;
  case "sábado":
    console.log("Hoje é sábado");
    break;
  case "domingo":
    console.log("Hoje é domingo");
    break;
  default:
    console.log("Dia inválido");
    break;
}

// Resultado: "Hoje é quinta-feira"
```

## Uso do comando `break`

Quando se usa o condicional `switch` é importante que se use o comando `break` para que o código não continue executando os `case` restantes que não sejam iguais ao valor da expressão. Exemplo:

```javascript
var dia = "quinta";

switch (dia) {
  case "segunda":
    console.log("Hoje é segunda-feira");
  case "terça":
    console.log("Hoje é terça-feira");
  case "quarta":
    console.log("Hoje é quarta-feira");
  case "quinta":
    console.log("Hoje é quinta-feira");
  case "sexta":
    console.log("Hoje é sexta-feira");
  case "sábado":
    console.log("Hoje é sábado");
  case "domingo":
    console.log("Hoje é domingo");
  default:
    console.log("Dia inválido");
}

// Resultado:
// "Hoje é quinta-feira"
// "Hoje é sexta-feira"
// "Hoje é sábado"
// "Hoje é domingo"
// "Dia inválido"
```

## Referências

- Mozilla Foundation
  ([switch](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Statements/switch))
- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 14.12 The switch Statement
