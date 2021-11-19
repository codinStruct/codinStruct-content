# Variáveis

## O Que São?

Uma definição básica para variável é um objeto nomeado que armazena alguma
informação. Uma variável seria como uma caixa que possui um nome (formalmente
identificador). Nessa caixa é possível armazenar diversas coisas, e ela pode ser
acessada para revelar o que está contido nela.

## Criação

Para criar uma variável, podemos utilizar a sintaxe `<nome> = <valor inicial>`.
O `<nome>` possui algumas regras, e.g. não pode começar com números e não pode
ser uma palavra reservada.

Palavras reservadas são palavras que já tem algum significado específico no
código, ou estão, como o nome sugere, reservadas para uso futuro. Algumas
palavras reservadas são:

_and_, _as_, _assert_, _break_, _class_, _continue_, _def_, _del_, _elif_,
_else_, _except_, _exec_, _finally_, _for_, _from_, _global_, _if_, _import_,
_in_, _is_, _lambda_, _nonlocal_, _not_, _or_, _pass_, _raise_, _return_, _try_,
_while_, _with_, _yield_, _True_, _False_ e _None_.

Não é necessário conhecer o significado de cada uma delas no momento.

## Uso

Uma variável serve como apelido para o valor que ela armazena. Isso significa
que após `a = 5`, `b = a` é equivalente a `b = 5`. Se o valor de `a` for
alterado futuramente, o valor de `b` permanecerá o mesmo.
