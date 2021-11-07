# Tipos

Javascript tem uma tipagem dinâmica, ou seja, não é necessário declarar o tipo de uma variável antes de atribuí-la. Além disso uma variável já declarada e com valor atribuído pode ser atribuido outro valor de outro tipo.

De acordo com a especificação ECMAScript 2022 existem 8 tipos primitivos:

|          Tipo | Descrição                                                    |
| ------------: | :----------------------------------------------------------- |
| **number**    | Números inteiros e reais (`1`, `2.5`, `-3`, `-4.5`).         |
| **string**    | Um texto qualquer (`"codinStruct"`, `"João Moreira Silva"`). |
| **boolean**   | Verdadeiro ou Falso (`true`, `false`).                       |
| **null**      | Um valor inexistente (`null`).                               |
| **undefined** | Valor de uma variável que não foi declarada (`undefined`).   |
| **symbol**    | Um identificador único (`Symbol(id)`).                       |
| **object**    | Um objeto (`{}`).                                            |
| **function**  | Uma função (`function() {}`).                                |

## Referências

- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 6.1 ECMAScript Language Types
