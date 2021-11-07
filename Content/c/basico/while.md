# Instrução `while`

A instrução `while` é muito parecida com a instrução `if`, porém a instrução
seguinte será executada repetidamente até que a condição seja falsa. Nas
instruções de iteração, como `while`, a instrução após a condição é chamada
_loop body_.

Um exemplo de uso do `while` é um contador. Utilizando um _loop body_ que exibe
o valor de uma variável e a incrementa, podemos gradualmente incrementar essa
variável até que a condição seja falsa. Você consegue imaginar a saída produzida
pelo código abaixo?

```c
int contador = 0;

//      ⬐ Enquanto contador for menor ou igual a 10
while (contador <= 10)
{ // ← Início do loop body

    // Exibir o valor do contador
    printf("%d ", contador);

    // Incrementar o contador em 1
    contador = contador + 1;

} // ← Fim do loop body

puts("e terminamos!");
```

Saída: `0 1 2 3 4 5 6 7 8 9 10 e terminamos!`

Enquanto esse tipo de laço tem seus usos, eles são mais poderosos quando
utilizados com arrays. Utiliznado um laço que percorre um array, podemos
realizar operações com todos seus elementos um por um. Que tal reduzir um array
à soma de todos valores nele contidos?

```c
int array[5] = {10, 5, 3, 5, 2};
int soma = 0; // Armazenamos a soma aqui

// Utilizamos esse "índice" para acessar cada elemento
int i = 0;

while (i < 5)
{
    // Adicionamos o valor do elemento à soma
    soma = soma + array[i];

    // Incrementamos o índice
    i = i + 1;
}
```

Após a execução do código acima, a variável `soma` terá o valor `25`. A
instrução `for` costuma ser mais apropriada para percorrer arrays. Ela será
introduzida em breve.

Outra utilidade do `while` é fazer menus com opções. Vejamos um exemplo:

```c
int opcao = 1;

while (opcao != 0)
{
    // Exibir as opções
    printf("0 - Sair\n"
           "1 - Exibir \"Olá\"\n"
           "2 - Exibir \"Mundo!\"\n"
           "Opção: ");

    // Ler a opção escolhida
    scanf("%d", &opcao);

    // Exibir a palavra escolhida
    if (opcao == 1)
        puts("Olá");
    else if (opcao == 2)
        puts("Mundo!");
    else
        puts("Opção inválida!");
}
```

Assim que a opção for 0, o laço será interrompido. Enquanto isso não acontecer,
"Olá" ou "Mundo!" serão exibidos conforme as escolhas.

Você pode ter percebido que na primeira execução, verificar a condição é inútil
pois `opcao` possui inicialmente o valor `1`. Para ignorar a condição na
primeira execução, basta utilizar a palavra-chave `do` antes da instrução
composta e mover o `while` com sua condição para após a instrução. Veja a versão
modificada para isso ficar mais claro:

```c
int opcao = 1;

do // Substituímos o while (...) por do
{
    printf("0 - Sair\n"
           "1 - Exibir \"Olá\"\n"
           "2 - Exibir \"Mundo!\"\n"
           "Opção: ");

    scanf("%d", &opcao);

    if (opcao == 1)
        puts("Olá");
    else if (opcao == 2)
        puts("Mundo!");
    else
        puts("Opção inválida!");
} while (opcao != 0); // O while (...) fica após a instrução
```

Assim, não fazemos mais a verificação desnecessária do valor de `opcao`
inicialmente.

É possível interromper um laço prematuramente usando a palavra-chave `break`,
que para a execução do laço assim que executada. Podemos fazer um laço com uma
tautologia (condição sempre verdadeira) e utilizar `break` para pará-lo:

```c
while (true) // Lembre-se de incluir <stdbool.h>
{
    printf("0 - Sair\n"
           "1 - Exibir \"Olá\"\n"
           "2 - Exibir \"Mundo!\"\n"
           "Opção: ");

    int opcao;
    scanf("%d", &opcao);

    // Parar o laço caso a opção seja 0
    if (opcao == 0)
        break;

    if (opcao == 1)
        puts("Olá");
    else if (opcao == 2)
        puts("Mundo!");
    else
        puts("Opção inválida!");
}
```

Repare que como a condição não utiliza mais a variável `opcao`, ela pôde ser
movida para dentro da instrução composta, pois apenas lá ela é utilizada. Mesmo
com as mudanças, o código ainda aparenta se comportar da mesma forma.
