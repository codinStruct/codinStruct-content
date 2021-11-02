# Saída

1. Qual a diferença entre as saídas dos dois trechos abaixo? Imagine que
   `<stdio.h>` está incluído.

   ```c
   puts("Olá, ");
   puts("Mundo!");
   ```

   ```c
   printf("Olá, ");
   printf("Mundo!");
   ```

2. Qual a saída do seguinte trecho?

   ```c
   printf("15%c", '9');
   putchar('7');
   puts("332");
   printf("%d5\n", 2);
   ```

3. Para exibir os valores corretamente, quais especificações devemos usar no
   lugar dos `[]`?

   ```c
   printf("A temperatura prevista para o dia [] de [] é [] graus.",
          25,
          "outubro",
          17.3);
   ```

## Respostas

1. No primeiro caso "Olá, " e "Mundo!" aparecem em linhas diferentes. No
   segundo, a saída é apenas uma linha contendo "Olá, Mundo!".

2. ```plaintext
   1597332
   25
   ```

3. `%d`, `%s` e `%f`.
