# Listas

Lista é um tipo de dado para armazenar coleção de dados. Apesar da simplicidade para ser usada, tem uma grande utilidade, onde é possível guardar vários tipos de dados, dentro de uma lista. Para começarmos, vamos entender como se cria uma lista:

Para criarmos uma lista, usamos `[]` e os dados dentro da lista. Vale a pena lembrar que, as listas podem armazenar quaisquer tipos de dados, inclusive, listas.

Vamos a alguns exemplos:

- Listas de Strings:

```python
lista = ["Maçã", "Banana", "Melancia"]
print(lista)
# O Resultado é: ['Maçã', 'Banana', 'Melancia']
```

- Lista de Inteiros:

```python
lista = [1, 2, 3, 4]
print(lista)
# O Resultado é: [1, 2, 3, 4]
```

- Listas de Booleans:

```python
lista = [True, False, True, True]
print(lista)
# O Resultado é: [True, False, True, True]
```

- Lista de Listas:

```python
lista1 = ["João", 21, False]
lista2 = [1, 2, 3, 4]
lista3 = [True, False, True, True]
lista = [lista1, lista2, lista3]
print(lista)
# O Resultado é: [['João', 21, False], [1, 2, 3, 4], [True, False, True, True]]
```

## Mais sobre listas

Para se acessar um valor específico de uma lista, basta acrescentar o valor do seu `índice`. Caso você não esteja familiarizado, os índices começam em 0. Vamso a um exemplo:

```python
# ÍNDICES: 0      1       2
lista = ["João", 21, "Estudante"]
print(lista[2])
# O Resultado é: ['Estudante']
```

## Propriedades

As listas tem alguma diferenças, de outros tipos de dados usados para armazenar coleções, como por exemplo:

- Ordenado:

A lista é ordenada, ou seja, a cada item adicionado, ele ficará na ordem em que foi adicionado.

```python
lista = ["A", "B", "C"]
print(lista)
# Saída: ['A', 'B', 'C']
```

- Mutável:

A lista pode ser alterada, ou seja, podemos adicionar, remover ou alterar itens dela.

```python
lista = ["A", "B", "C"]
lista[2] = 10
print(lista)
# Saída: ['A', 'B', 10]
```

- Duplicados:

A lista permite que se tenha valores duplicados, como ela é indexada, é possível adicionar itens duplicados tranquilamente.

```python
lista = ["A", "B", "C", "B"]
print(lista)
# Saída: ['A', 'B', 'C', 'B']
```
