# Variáveis

## O que é?

Basiscamente, variável é um espaço que é reservado na memória do seu computador para que você guarde alguma informação. Suponhamos que você tenha uma gaveta, e essa gaveta seria seu espaço na memória. Quando é feito o que chamamos de `Declarar uma variável`, você está dizendo para seu guarda-roupas (ou seja lá o móvel que você tenha uma gaveta) que você vai usar aquela gaveta, que você dará um nome, e guardará nela algo, que será o valor.

## Criação
A sintaxe de declaração de uma variável seria:

```python
nomeVariavel = valor
```

Você pode dar o nome que quiser a sua variável, desde que essa não seja uma palavra reservada. Palavra reservada, diz respeito a palavras que tem alguma utilidade no Python, como o exemplo da função `print` que usamos em uma aula passada.
## Palavras reservadas
Algumas dessas palavras reservadas são:

```python
and, as, assert, break, class, continue
,def, del, elif, else, except, exec
,finally, for, from, global, if, import
,in, is, lambda, nonlocal, not, or
,pass, raise, return, try, while, with
,yield, True, False, None
```

Não se preocupe com elas, pois no decorrer do curso, iremos explicar a função de cada uma!

## Tipos de variáveis


Mesmo os tipos não sendo declarados explicitamente (algumas linguagens utilizam o que chamamos de tipagem estática, onde o programador define o tipo daquela variável, por exemplo `int numero = 10`), eles sempre irão assumir um tipo de dado. Abaixo, exemplos de retornos de tipos:

- Tipo String:

Servem para guardar uma cadeia de caracteres:

```python
>>> a = 'CodinStruct'
>>> type(a)
<type 'str'>
```

- Tipo inteiro:

Servem para guardar números inteiros:

```python
>>> a = 1
>>> type(a)
<type 'int'>
```

- Tipo ponto flutuante:

Servem para guardar números reais:

```python
>>> a = 1.0
>>> type(a)
<type 'float'>
```

- Tipo booleano:

Servem para guardar valores lógicos (`True` ou `False`):

```python
>>> a = True
>>> type(a)
<type 'bool'>
```

- Tipo complexo:

Servem para guardar a combinação de um número real com um número imaginário:

```python
>>> a = 4+3j
>>> type(a)
<type 'complex'>
```
