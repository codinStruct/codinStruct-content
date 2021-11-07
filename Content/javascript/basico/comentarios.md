# Comentários

Comentários são utilizados para adicionar uma observação em um código de tal forma a não impedir ou atrapalhar a execução de tal código. Ao chegar em comentário o processador de JavaScript simplesmente o ignorará e continuará seguindo o código. Em Javascript existem dois tipos de comentários: De linha e de bloco.

Comentários de linha ignoram apenas uma linha por vez e servem para adicionar uma curta observação em um trecho de código. Esse tipo de comentário utiliza duas barras (`//`) para iniciar o comentário.

```javascript
// A variável nome recebe o valor "João"
// A variável idade recebe o valor 18
var nome = "João";
var idade = 18;
```

Comentários de bloco tem um início e fim bem definidos, sendo que tudo entre esses dois pontos será ignorado, e servem para adicionar uma observação mais envolvida e longa em um trecho de código. Esse tipo de comentário utiliza uma barra e asterisco (`/*`) para iniciar o comentário e um asterisco e barra (`*/`) para finalizá-lo.

```javascript
/*
A velocidade tem 3 níveis:
1 - Devagar
2 - Médio
3 - Rápido
*/
var velocidade = 3;
```

## Referências

- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 12.4 Comments
