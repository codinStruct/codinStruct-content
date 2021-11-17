# Alteração em coleções

Temos várias coleções, e podemos fazer várias alterações, conforme já foi passado no curso, temos `conjuntos`, `dicionario`, `tuplas`, `listas`. Vamos conhecer mais sobre cada uma delas.

## Listas

Para acessarmos um valor de uma lista, procuramos pelo seu índice `[1]`, por exemplo:

```python
lista = [1, 2, 3, 4]
print(lista[2])
# Saída: 3
```

Para acessarmos apenas alguns itens da lista, podemos usar a seguinte sintaxe: `[:]`, o valor colocado antes do `:`, será usado como o início de onde você quer exibir os itens, consequentemente, o valor colocado depois, será até quanto, caso a esquerda fique vazio, será entendido como o primeiro, se o da direita ficar vazio, será considerado o último por exemplo:

```python
lista = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(lista[2:])
# Saída: [3, 4, 5, 6, 7, 8, 9]
print(lista[2:3])
# Saída: [3]
print(lista[:3])
# Saída: [1, 2, 3]
```

Para procurarmos algo em uma lista, podemos usar a seguinte estrutura:

```python
lista = ["Maçã", "Banana", "Melancia"]
if "Maçã" in thislist:
  print("Sim, 'Maçã' existe nesta lista!")
# Saída: Sim, 'Maçã' existe nesta lista!
```

Para inserirmos um item na lista em determinada posição, usamos `insert`, vejamos o exemplo:

```python
lista = ["Maçã", "Banana", "Melancia"]
lista.insert(2, "Goiaba")
print(lista)
# Saída: ['Maçã', 'Banana', 'Goiaba', 'Melancia']
```

Para inserirmos um item no final da lista, usamos `append`, vejamos um exeplo:

```python
lista = ["Maçã", "Banana", "Melancia"]
lista.insert("Goiaba")
print(lista)
# Saída: ['Maçã', 'Banana', 'Melancia', 'Goiaba']
```

Para adicionarmos uma coleção no final de uma lista, usamos `extend`, veja o exemplo:

```python
lista = ["Maçã", "Banana", "Melancia"]
lista2 = ["Limão", "Laranja"]
lista.extend(lista2)
print(lista)
# Saída: ['Maçã', 'Banana', 'Melancia', 'Limão', 'Laranja']
```

Para removermos um item da lista, temos várias soluções, vejamos os exemplo abaixo:

```python
lista = ["Maçã", "Banana", "Melancia"]
lista.remove("Melancia") # remove o item citado
lista.pop(2) # remove o item de index 2
lista.pop() # remove o último item
del lista[2] # remove o último item
print(lista)
# Saída em todos os casos: ['Maçã', 'Banana']
del lista # remove a lista inteira
print(lista)
# Saída: ERRO
lista.clear()
print(lista) #Limpa a lista
# Saída: []
```
