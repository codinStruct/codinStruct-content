# Funções

1. Como especificamos que uma função não recebe nenhum parâmetro?

2. Como especificamos que uma função não retorna nenhum valor?

3. Crie uma função que não possui parâmetros nem retorno.

4. Crie uma função que recebe um `int` e retorna um valor `int` qualquer.

5. Crie uma função que recebe um `int` e retorna o valor desse `int`.

6. Siga os seguintes passos.
   - Crie uma função sem parâmetros e retorno, chamada `a`.
   - Crie uma função sem parâmetros, retornando um `int`, chamada `b`. Dentro de
     `b`:
     - Chame a função `a`.
     - Depois, retorne o valor `0`.

## Respostas

1. Com o tipo `void` entre os parênteses da lista de parâmetros.

2. Especificando o tipo de retorno `void`.

3. Utilizando o nome `foo`: `void foo(void) {}`.

4. Utilizando o nome `bar` e recebendo um `int` chamado `n`:

   ```c
   int bar(int n)
   {
       return 259;
   }
   ```

5. Utilizando o nome `baz` e recebendo um `int` chamado `n`:

   ```c
   int baz(int n)
   {
       return n;
   }
   ```

6. ```c
   void a(void) {}

   int b(void)
   {
       a();
       return 0;
   }
   ```
