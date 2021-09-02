# Diretiva #include

As diretivas de pré-processamento são processadas antes da compilação do
programa e alteram o código-fonte que será compilado. Como compiladores
sofisticados realizam essa tarefa automaticamente, você não verá o resultado
dessa etapa; o código gerado será enviado diretamente ao compilador e
descartado.

## Exemplos

A diretiva `#include` faz que o pré-processador inclua código externo no arquivo
a ser compilado. Imagine dois arquivos:

Arquivo `externo.c`:

```c
// Olá,
// eu sou o conteúdo do arquivo externo.c
```

Arquivo `main.c`:

```c
#include "externo.c"

int main(void)
{
    return 0;
}
```

Quando a compilação de `main.c` for solicitada, o pré-processador enviará o
seguinte código para o compilador:

```c
// Olá,
// eu sou o conteúdo do arquivo externo.c

int main(void)
{
    return 0;
}
```

Como pode ser observado, a diretiva `#include` é substituída pelos conteúdos do
arquivo incluído. Aqui está mais um exemplo:

Arquivo `externo.c`:

```c
    return 0;
```

Arquivo `main.c`:

```c
int main(void)
{
#include "externo.c"
}
```

Resultado do pré-processamento de `main.c`:

```c
int main(void)
{
    return 0;
}
```

## Variações

É possível incluir certo arquivo de duas formas:

- **`#include <arquivo>`**:
  - Deve ser utilizado com arquivos cuja localização é conhecida pelo
    pré-processador; os arquivos da biblioteca padrão como `stdio.h` normalmente
    podem ser incluídos dessa forma. As localizações buscadas costumam ser
    definidas em uma
    [variável de ambiente](https://pt.wikipedia.org/wiki/Vari%C3%A1vel_de_ambiente).
- **`#include "arquivo"`**:
  - Deve conter o caminho para o arquivo, como
    `C:/Users/João/Documents/arquivo`. Normalmente esse caminho pode também ser
    relativo à localização atual. Caso o arquivo não seja encontrado, ele será
    buscado da forma anterior.

Caso seu compilador não realize o pré-processamento automaticamente, aprenda a
utilizar algum pré-processador adequado. Isso está fora do escopo desse
conteúdo.

## Referências

- Padrão C18 ([ISO/IEC 9899:2018](https://www.iso.org/standard/74528.html)):
  - 6.10.2 Source file inclusion
