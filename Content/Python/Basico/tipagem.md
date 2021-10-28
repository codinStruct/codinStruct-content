# Tipagem dinâmica

Quando falamos sobre variáveis, houve uma citação dizendo que algumas linguagens usam a tipagem estática, onde é especificado o tipo de dados que determinada variável terá.

Python, usa um conceito diferente que seria a tipagem dinâmica, ou seja, o tipo da variável será "revelado" de acordo com a execução do programa.

Quando fazemos uma entrada visto no tópico passado:

```python
numero = input("Digite um número")
```

Estamos simplesmente pegando algo do usuário e inserindo na variável `numero`, que não é necessariamente um número, pois, da forma como é feito, a variável é uma string (isso por ser verificado através da função `type(numero)` )

Portanto, se quisermos forçar que o usuário digite um número, devemos fazer o que chamamos de `cast`

Temos duas formas de fazer, que são:

```python
numero = input("Digite o número")
numero = int(numero)
```

ou:

```python
numero = int(input("Digite o número"))
```

Dessa forma, transformamos o tipo da variável `numero` em int (numero inteiros)

O mesmo vale para os outros tipos:

```python
int()
str()
float()
```
