# Tabelas de tipos fundamentais

## Tipos inteiros

| Especificadores (palavras-chave, a ordem não importa)                                   |   Tipo equivalente   | Descrição                                                                |
| --------------------------------------------------------------------------------------- | :------------------: | ------------------------------------------------------------------------ |
| `_Bool`                                                                                 |       `_Bool`        | Tipo booleano, armazena `1` ou `0`                                       |
| `signed char`                                                                           |    `signed char`     | Caractere armazenado como inteiro com sinal                              |
| `unsigned char`                                                                         |   `unsigned char`    | Caractere armazenado como inteiro sem sinal                              |
| `char`                                                                                  |        `char`        | Se comporta igual `signed char` ou `unsigned char` dependendo do sistema |
| `short` ou<br>`short int` ou<br>`signed short` ou<br>`signed short int`                 |     `short int`      | Tipo inteiro, menor ou igual a `int`                                     |
| `unsigned short` ou<br>`unsigned short int`                                             | `unsigned short int` | Versão sem sinal de `short`                                              |
| `int` ou<br>`signed` ou<br>`signed int`                                                 |        `int`         | Tipo inteiro, menor ou igual a `long`                                    |
| `unsigned` ou<br>`unsigned int`                                                         |    `unsigned int`    | Versão sem sinal de `int`                                                |
| `long` ou<br>`long int` ou<br>`signed long` ou<br>`signed long int`                     |      `long int`      | Tipo inteiro, menor ou igual a `long long`                               |
| `unsigned long` ou<br>`unsigned long int`                                               | `unsigned long int`  | Versão sem sinal de `long`                                               |
| `long long` ou<br>`long long int` ou<br>`signed long long` ou<br>`signed long long int` |   `long long int`    | Maior tipo inteiro exigido pelo padrão C                                 |
| `unsigned long long` ou<br>`unsigned long long int`                                     | `unsigned long int`  | Versão sem sinal de `long long`                                          |

## Tipos flutuantes

| Especificadores (palavras-chave, a ordem não importa) | Descrição                                                       |
| ----------------------------------------------------- | --------------------------------------------------------------- |
| `float`                                               | Representa números reais                                        |
| `double`                                              | Representa números reais com precisão maior ou igual a `float`  |
| `long double`                                         | Representa números reais com precisão maior ou igual a `double` |
