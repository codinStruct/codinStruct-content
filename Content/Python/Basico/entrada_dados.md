# Entrada de Dados

Certo, agora que já aprendemos com exibir algo na tela e sobre variáveis, vamos aprender como "pegar" dados de um usuário.

Digamos que você queira fazer uma calculadora, então, para que seja calculado os valores, seria necessário pegar esses valores de quem deseja fazer o cálculo, certo?

Temos então, uma função para isso, chamada `input`. Com ela, você pega a informação do usuário, veja como funciona:

```python
input("Mensagem Que irá aparecer")
```

Como visto, você deve digitar entre as `""` a mensagem que você quer que a pessoa leia, no nosso exemplo da calculadora, seria:

```python
input("Digite o primeiro número para ser calculado")
```

Porém, da forma como está, o programa simplesmente irá pegar o valor do usuário, e não irá armazenar em lugar nenhum, para isso, usamos as variáveis!

```python
n1 = input("Digite o Primeiro número")

n2 = input("Digite o Segundo número")
```

