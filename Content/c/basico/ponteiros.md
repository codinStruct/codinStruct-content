# Ponteiros

Um ponteiro é um tipo que se refere a outro objeto. Utilizar o símbolo `*` em
uma declaração faz com que ela seja um ponteiro, por exemplo:

```c
char  *a;  // a é um ponteiro para um char
int   *b;  // b é um ponteiro para um int
float *c;  // c é um ponteiro para um float
float **d; // d é um ponteiro para um ponteiro para um float
```

Para fazer com que um ponteiro se refira a uma variável, precisamos adquirir o
endereço da variável na memória com o operador `&` e atribuí-lo ao ponteiro:

```c
char A;
int B;
float C;
float *D;

a = &A; // a agora se refere à variável A
b = &B; // b agora se refere à variável B
c = &C; // c agora se refere à variável C
d = &D; // d agora se refere à variável D
```

## Operador de indireção

O símbolo `*` é comumente o operador "produto" e realiza multiplicação, mas
quando precede um ponteiro esse mesmo símbolo é o operador "indireção". A
indireção serve para acessar o objeto alvo do ponteiro, por exemplo:

```c
int i;

int *p = &i; // p se refere a i

*p = 5; // A indireção acessa i
printf("%d\n", i)   // Exibe 5
printf("%d\n", *p) // Exibe 5

i = 12;
printf("%d\n", i)   // Exibe 12
printf("%d\n", *p) // Exibe 12
```

Como pode ser observado acima, a indireção de um ponteiro é análoga ao objeto a
que ele se refere. I.e., `*p = 2` é efetivamente `i = 2`.

## Ponteiros como parâmetros

Até agora vimos o que um ponteiros fazem, mas não um motivo para usá-los. Um
caso em que ponteiros são úteis é uma função que deve modificar o valor de seus
argumentos, tome como exemplo uma função que incrementa um inteiro:

```c
void incremento(int valor)
{
    valor = valor + 1;
}
```

Como o escopo de `valor` é o corpo da função, a atribuição não possui efeito no
código externo. Para que o resultado seja utilizado, nesse caso, é preciso
retorná-lo:

```c
int incremento(int valor)
{
    return valor + 1;
}
```

Porém essa função é contraintuitiva, `incremento(num)` retorna `num + 1` mas o
valor de `num` é inalterado a não ser que o retorno seja utilizado:
`num = incremento(num)`. Utilizando ponteiros, esse incômodo pode ser evitado:

```c
void incremento(int *endereço)
{
    *endereço = *endereço + 1;
}
```

A função acima recebe um ponteiro e incrementa o valor do inteiro a que ele se
refere. Embora o escopo de `endereço` seja o corpo da função, o objeto alvo pode
estar em algum lugar externo. Essa versão é mais intuitiva que a anterior, pois
basta utilizar `incremento(&num)` para `num` ser incrementado, sem necessidade
de receber um valor de retorno.
