# Conjuntos

Os conjuntos, semelhantemente a Lista e Tupla, são usados para armazenar coleções de dados. Vejamos um exemplo de sua implementação:

```python
conjuntos = {"Maçã", "Banana", "Melancia"}
print(conjuntos)
# Saída: {'Maçã', 'Banana', 'Melancia'}
```

Os conjuntos contém algumas diferenças de propriedades comparadas com uma Lista e uma Tupla, como por exemplo, não existe índice (Não é possível acessar um item do conjunto com `[1]`)

```python
conjunto = {"Maçã", "Banana", "Melancia"}
print(conjunto[1])
# Saida: ERRO
```

## Propriedades

- NÃO Ordenado:

Os conjuntos não são ordenados, ou seja, a ordem em que eles são criados, não são a ordem que serão exibidos.

```python
conjunto = {"A", "B", "C"}
print(conjunto)
# Saída: {'C', 'A', 'B'}
```

- Imutável:

Os cojuntos NÃO podem ser alterados, ou seja, não podemos adicionar, remover ou alterar itens após a criação de um cojunto.

```python
conjunto = {"A", "B", "C"}
conjunto[2] = 10
print(conjunto)
# Saída: ERRO
```

- Duplicados:

A conjunto NÃO permite valores duplicados, como não é indexada, não é possível adicionar itens duplicados.

```python
conjunto = {"A", "B", "C", "B"}
print(conjunto)
# Saída: {'A', 'C', 'B'}
```
