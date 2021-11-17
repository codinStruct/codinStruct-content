# Dicionário

Os dicionários, são tipos de dados também usados para armazenar coleções de dados, porém, os dicionários tem uma particularidades, onde os índices, são selecionados por quem está os criando, ou seja, se na lista temos os índices `[0], [1], etc`, nos dicionários temos índices criados da forma como queremos, por exemplo `["nome"]`. Vejamos alguns exemplos:

```python
dicionario = {"nome": "João", "idade": 21}
print(dicionario)
# Saída: {'nome': 'João', 'idade': 21}
```

Para acessarmos algum atributo específico, procuramos por sua chave:

```python
dicionario = {"nome": "João", "idade": 21}
print(dicionario["nome"])
# Saída: João
print(dicionario["idade"])
# Saída: 21
```

## Propriedades

- Ordenados

Quando dizemos que os dicionários estão ordenados, significa que os itens tem uma ordem definida e essa ordem não será alterada.

```python
dicionario = {"nome": "João",
              "idade": 21}
print(dicionario)
# Saída: {'nome': 'João', 'idade': 21}
```

- Mutável

Os dicionários podem ser alterados, o que significa que podemos alterar, adicionar ou remover itens após a criação do dicionário.

```python
dicionario = {"nome": "João",
              "idade": 21}
dicionario["nome"] = "Elias"
print(dicionario)
# Saída: {'nome': 'Elias', 'idade': 21}
```

- Duplicatas

Os dicionário não permitem chaves(índices) duplicados, ou seja, não podemos ter o seguinte caso:

```python
dicionario = {"nome": "João",
              "idade": 21
              "nome": "Elias"}
print(dicionario)
# Saída: ERRO
```
