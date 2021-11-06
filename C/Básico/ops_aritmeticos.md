# Operadores Aritméticos Básicos

1. Faça uma função que recebe dois `int` e retorna sua soma.

2. Tente reescrever a função anterior sem usar o operador `+`, com os mesmos
   resultados.

3. Crie uma função que retorna quantas horas há em `n` minutos.

4. Crie uma função que retorna a área de um quadrado de altura `h` e largura
   `w`.

## Respostas

1. ```c
   int soma(int a, int b)
   {
       return a + b;
   }
   ```

2. ```c
   int soma2(int a, int b)
   {
       return a - -b; // O mesmo que a - (-b)
   }
   ```

3. ```c
   int horas(int n)
   {
       return n / 60;
   }
   ```

4. ```c
   double area(double h, double w)
   {
       return h * w;
   }
   ```
