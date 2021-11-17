# Tuplas

Parecida com Listas, a Tupla também é usada para armazenar coleções de dados. Diferente das Listas, que são inicializadas com `[]`, as tuplas são iniciadas com `()`.Vejamos alguns exemplos de como funcionam as Tuplas:

```python
tupla = ("Maçã", "Banana", "Melancia")
print(tupla)
# Saida: ('Maçã', 'Banana', 'Melancia')
```

Muito semelhante as Listas, as Tuplas possuem propriedades parecidas com as listas, como por exemplo, elas são ordenadas, e seus itens podem ser acessados atraves de index `[1]`:

```python
tupla = ("Maçã", "Banana", "Melancia")
print(tupla[1])
# Saida: Banana
```

## Propriedades

- Ordenado:

A tupla é ordenada, ou seja, a cada item adicionado, ele ficará na ordem em que foi adicionado.

```python
tupla = ("A", "B", "C")
print(tupla)
# Saída: ('A', 'B', 'C')
```

- Imutável:

Diferente da Listas, a tupla NÃO pode ser alterada, ou seja, não podemos adicionar, remover ou alterar itens após a criação dela.

```python
tupla = ("A", "B", "C")
tupla(2) = 10
print(tupla)
# Saída: ERRO
```

- Duplicados:

A tupla permite que se tenha valores duplicados, como ela é indexada, é possível adicionar itens duplicados tranquilamente.

```python
tupla = ("A", "B", "C", "B")
print(tupla)
# Saída: ('A', 'B', 'C', 'B')
```
