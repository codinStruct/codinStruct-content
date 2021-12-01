# Tipagem dinâmica

Python utiliza o conceito de tipagem dinâmica, ou seja, o tipos dos objetos em
um programa podem variar durante a execução.

Ao fazemos uma entrada, como `n = input("Digite um número: ")` Estamos
simplesmente lendo um valor e inserindo na variável `n`. Embora a mensagem
sugira que `n` receberá um número, a função `input` retorna uma _string_
(sequência de caracteres). `n`, então, é inicialmente uma _string_. Isso pode
ser verificado com a função `type`: `type(n)`.

Se quisermos forçar que a entrada seja interpretada como um número, devemos
converter seu tipo utilizando um construto chamado _cast_. No nosso caso o
_cast_ será feito utilizando a função `int`, que retorna um número inteiro a
partir de uma _string_:

```python
n = int(input("Digite um número: "))
```

Dessa forma, a _string_ retornada é transformada em um número inteiro; assim,
`n` agora é um inteiro.

Além da função `int`, há funções similares como `str` (produz uma _string_) e
`float` (produz um número real).

## Tipos

Alguns dos tipos preexistentes no Python são os seguintes.

- `str` (popularmente _string_): Representa uma cadeia de caracteres, como
  `"abc"`:

  ```python
  >>> a = 'codinStruct'
  >>> type(a)
  <type 'str'>
  ```

- `int`: Representa um número inteiro, como `59`:

  ```python
  >>> a = 1
  >>> type(a)
  <type 'int'>
  ```

- `float`: Representa um número real, como `3,14`:

  ```python
  >>> a = 1.0
  >>> type(a)
  <type 'float'>
  ```

- `bool`: Pode alternar entre os valores lógicos `True` (verdade) e `False`
  (falsidade).

  ```python
  >>> a = True
  >>> type(a)
  <type 'bool'>
  ```
