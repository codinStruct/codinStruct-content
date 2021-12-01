# Operadores de Incremento e Decremento

Incrementar ou decrementar algum número por 1 é muito comum, portanto existem
operadores para fazer isso de forma concisa.

## Operadores de Prefixo `++` e `--`

Esses operadores unários ficam à esquerda de seus operandos e os modificam,
incrementando (no caso de `++`) ou decrementando (no caso de `--`) o valor em 1.

```c
int n = 5;

++n; // Incrementa n em 1
printf("%d\n", n); // Exibe 6

--n; // Decrementa n em 1
printf("%d\n", n); // Exibe 5
```

Essas operações não só modificam o operando mas também possuem o valor dele.
Isso significa que o valor de `++n` é `n + 1` e o valor de `--n` é `n - 1`.

```c
int n = 5;

printf("%d\n", ++n); // Exibe 6
printf("%d\n", --n); // Exibe 5
```

## Operadores de Sufixo `++` e `--`

Ao contrário dos operadores de prefixo, esses operadores ficam à direita do
operando. O comportamento é similar: `++` incrementa e `--` decrementa, porém a
alteração no valor não ocorre imediatamente. A alteração ocorre durante o
próximo ponto de sequência. Pontos de sequência existem em vários lugares
diferentes no C, mas considerar todo `;` um ponto de sequência é uma heurística
razoável.

```c
int n = 5;

printf("%d\n", n++); // Exibe 5
printf("%d\n", n); // Exibe 6 (pois o ponto de sequência já passou)

int o = n++;

printf("%d\n", o); // Exibe 6
printf("%d\n", n); // Exibe 7
```

## Referências

- ISO/IEC JTC1/SC22/WG14 N2310:
  <!-- Efeito de pontos de sequência na avaliação de expressões -->
  - 5.1.2.3 Program execution
  - 6.5 Expressions:
    <!-- Operadores de sufixo ++ e -- -->
    - 6.5.2.4 Postfix increment and decrement operators
    <!-- Operadores de prefixo ++ e -- -->
    - 6.5.3.1 Prefix increment and decrement operators
