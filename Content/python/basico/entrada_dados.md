# Entrada de Dados

Agora que já aprendemos como exibir algo na tela e sobre variáveis, vamos
aprender como "pegar" dados de um usuário.

Digamos que você queira fazer uma calculadora. Para que sejam realizadas as
operações, é necessário ler valores informados pelo usuário.

Para isso temos a função `input`, que permite, você ler dados inseridos pelo
usuário. Veja um exemplo:

```python
input("Pedindo entrada do usuário")
```

Como visto, aspas duplas denotam um literal string—um pedaço de texto—que será
exibido na tela durante a execução da função. No caso de nossa calculadora ,
podemos utilizar:

```python
input("Digite o primeiro operando: ")
```

Essa invocação de `input` apenas lê o que o usuário digitar mas esse valor não é
armazenado em lugar algum. Podemos dar um nome a esse valor, assim ele não é
descartado:

```python
n1 = input("Digite o primeiro operando: ")
```

No caso acima, a entrada do usuário será armazenada e acessível na variável
`n1`.
