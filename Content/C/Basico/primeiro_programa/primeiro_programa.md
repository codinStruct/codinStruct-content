# Primeiro programa

O primeiro programa que várias pessoas costumam escrever consiste em exibir
"Hello, World!" ("Olá, Mundo!" em inglês). Um simples código C para essa tarefa
é o seguinte:

## Código-fonte

Arquivo `main.c`:

```c
#include <stdio.h>

int main(void)
{
    puts("Hello, World!");
    return 0;
}
```

Esse programa simples é composto por várias partes. Primeiro, `stdio.h` é o
arquivo que fornece as principais funções de entrada e saída no C. A linha
`#include <stdio.h>` essencialmente permite ao programa usar essas funções.

`main` é o ponto de entrada do programa, ou seja, onde começa a execução do
código. As chaves `{` e `}` representam o corpo do `main`, e o código entre elas
faz parte dele.

A primeira tarefa realizada em nosso `main` é a linha `puts("Hello, World!");`.
`puts` é uma das funções de entrada e saída do `stdio.h`, e ela exibe seu
argumento (em nosso caso, `"Hello, World"`) na tela.

Logo após isso temos a linha `return 0;`. `return` termina a execução da função,
que nesse caso é `main`, e `0` é um valor que será enviado ao sistema
operacional. `0` costuma significar que o programa foi executado corretamente.

## Executando

O [código-fonte](#código-fonte) acima está completo, mas ainda não é executável;
precisamos utilizar um compilador C para transformar código-fonte em código
objeto. Esse processo é chamado compilação e, por si só, não é suficiente para
produzir um executável. Antes da compilação deve ocorrer o pré-processamento e,
após a compilação, a ligação. Ambos processos são realizados automaticamente em
compiladores atuais (como [GCC](https://gcc.gnu.org/) e
[Clang](https://clang.llvm.org/)), portanto ainda não serão detalhados.

Para criar um executável utilizando o compilador GCC, por exemplo, você deve
fornecer como argumento o arquivo de extensão `.c` contendo o código-fonte. No
caso do programa acima, o comando seria `gcc main.c`. O executável comumente
será chamado `a.exe` ou `a.out`, mas o nome pode ser alterado fornecendo a opção
`-o` seguida pelo caminho de destino. Para criar o executável `Programa`
usaríamos o comando `gcc main.c -o Programa`.

Se tudo der certo, a execução do programa exibirá `Hello, World!`.

## Referências

- Padrão C18 ([ISO/IEC 9899:2018](https://www.iso.org/standard/74528.html)):
  - 5.1.2.2 Hosted environment
  - 6.8.6.4 The return statement
  - 7.21 Input/output <stdio.h>
