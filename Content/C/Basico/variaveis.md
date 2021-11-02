# Variáveis

## Definição e inicialização

A maneira mais simples de armazenar dados em C é pelo uso de variáveis.

Variáveis simples podem ser criadas especificando:

1. O tipo de dado que a variável armazena.
1. Seu declarador, que nos casos mais simples é simplesmente o identificador
   (nome) da variável

Para armazenar um número inteiro podemos criar uma variável do tipo `int`. Vamos
criar, por exemplo, a variável `num` com a sintaxe `<tipo> <declarador>;`:

```c
int num;
```

Como a variável `num` foi definida sem algum valor especificado, na maioria dos
casos ela é uma variável não inicializada—armazena um valor "lixo" que já estava
na memória. Para inicializá-la, basta especificar um inicializador (valor
inicial), tornando a sintaxe `<tipo> <declarador> = <inicializador>;`:

```c
int num = 62;
```

Assim, a variável armazena o número `62` e não algum valor aleatório. O `62`
pode ser trocado por qualquer outro número representável como um `int`, e.g.
`-5` ou `0`.

Várias variáveis podem ser definidas de uma só vez, para isso basta utilizar a
sintaxe `<tipo> <decl-init-lista>;`, sendo `decl-init-lista` uma lista (separada
por vírgula) de 1 ou mais declaradores opcionalmente seguidos de
inicializadores. Seguem 3 exemplos:

```c
int a = 62, b = 30, c = 49;

int d, e = 50, f;

int g = 32, h, i;
```

## Uso

Uma variável substituir um valor em vários casos, como uma chamada de função. As
duas funções a seguir retornam o mesmo resultado, porém a primeira faz o uso de
uma variável `n`:

```c
int foo(void)
{
    int n = 13;

    return log(n);
}

int bar(void)
{
    return log(13);
}
```

Variáveis, assim como o nome sugere, podem ter seus valores alterados durante a
execução do código. A função a seguir retorna o valor `5`, e não `99`:

```c
int foo(void)
{
  int n = 99;

  n = 5;

  return n;
}
```

## Escopo

Todos os identificadores, como nomes de variáveis e funções, possuem um escopo
que determina onde podem ser acessados.

### Escopo de bloco

Os parâmetros de uma função podem ser acessados apenas em seu corpo, isso
significa que `n` pode ser acessado em `foo` mas não em `bar`:

```c
int foo(int n)
{
    return n; // Okay
}

int bar(void)
{
    return n; // Erro: n não existe nesse contexto
}
```

Isso se chama escopo de bloco, ou seja, o identificador é acessível dentro do
bloco (`{}`}) a que pertence. No caso da seguinte variável `n`, o escopo é o
mesmo que seria como parâmetro:

```c
int foo(void)
{
    int n;

    return n; // Okay
}

int bar(void)
{
    return n; // Erro: n não existe nesse contexto
}
```

Um identificador também não pode ser definido duas vezes no mesmo bloco, mas
blocos podem ser aninhados:

```c
int foo(void)
{
    int n;

    int n; // Erro: n já foi definido nesse bloco
}

int bar(void)
{
    int n;

    {
        int n; // Okay: Esse n está contido apenas nesse bloco
    }
}
```

Vale lembrar, também, que mesmo sendo o mesmo identificador, `n` representa uma
entidade diferente em cada bloco que é redefinido:

```c
int foo(void)
{
    int n = 5;

    {
        int n = 10;

        return n; // Isso retorna 10 e não 5, pois a redefinição de n torna o
                  // n anterior inacessível
    }

    return n; // Isso retorna 5 pois aqui o segundo n sai de escopo e o primeiro
              // volta a estar acessível
}
```

Caso um identificador não seja redefinido em um bloco aninhado, sua definição
anterior será acessada:

```c
int foo(void)
{
    int n = 5;

    {
        return n; // Isso retorna 5
    }
}
```

### Escopo de arquivo

Uma variável declarada fora de um bloco possui escopo de arquivo—pode ser
acessada em qualquer lugar do arquivo após sua declaração:

```c
int n = 5;

int foo(void)
{
    return n; // Retorna 5
}

int bar(void)
{
    return n; // Retorna 5
}
```

Diferente de variáveis com escopo de bloco, variáveis com escopo de arquivo são
inicializadas com um valor definido de acordo com seu tipo. Se o inicializador
fosse removido do código acima `n` armazenaria `0`, enquanto se `n` tivesse
escopo de bloco não haveria nenhuma garantia de seu valor.

## Referências

- Padrão C18 ([ISO/IEC 9899:2018](https://www.iso.org/standard/74528.html)):
  - 6.2.1 Scopes of identifiers
  - 6.2.5 Types
  - 6.7 Declarations
  - 6.7.9 Initialization
