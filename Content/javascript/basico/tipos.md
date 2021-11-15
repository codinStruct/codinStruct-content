# Tipos

JavaScript tem uma tipagem dinâmica, ou seja, não é necessário declarar o tipo
de uma variável antes de atribuí-la. Além disso uma variável já declarada e com
valor atribuído pode ser atribuido outro valor de outro tipo.

De acordo com a especificação ECMAScript 2022 existem 8 tipos primitivos:

|          Tipo | Descrição                                                    |
| ------------: | :----------------------------------------------------------- |
|    **Number** | Números inteiros e reais (`1`, `2.5`, `-3`, `-4.5`).         |
|    **String** | Um texto qualquer (`"codinStruct"`, `"João Moreira Silva"`). |
|   **Boolean** | Verdadeiro ou Falso (`true`, `false`).                       |
|      **null** | Um valor inexistente (`null`).                               |
| **undefined** | Valor de uma variável que não foi declarada (`undefined`).   |
|    **Symbol** | Um identificador único (`Symbol(id)`).                       |
|    **Object** | Um objeto (`{}`).                                            |
|    **BigInt** | Números inteiros grandes (`3141592653589793238462643n`)      |

## Referências

- Ecma International ([ECMA-262](https://tc39.es/ecma262))
  - 6.1 ECMAScript Language Types
