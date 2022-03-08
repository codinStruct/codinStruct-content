# Contribuindo

Obrigado por tomar seu tempo para ler isso. Para contribuir ao repositório, é
recomendável que você discuta a mudança que deseja em uma issue antes de
enviá-la.

Para garantir que sua contribuição esteja de acordo com o esperado, leia e siga
o pequeno guia abaixo:

## Estilo

### Títulos de commits

Títulos de commits devem iniciar com certo emoji dependendo do tipo de
alteração. Isso pode deixar as mensagens mais concisas.

| Emoji | Significado                       |
| :---: | --------------------------------- |
|  ✨   | Conteúdo novo                     |
|  ✏️   | Conteúdo adicionado em uma página |
|  ♻️   | Conteúdo modificado em uma página |
|  🔍️  | Erro corrigido no conteúdo        |
|  🔥   | Arquivo removido                  |
|  💥   | Grandes mudanças                  |

### Livro e XML

Sempre que alguma página em `Content` for adicionada/removida, ordem das páginas
for alterada e/ou o cabeçalho nível 1 de uma página for modificado, as mudanças
devem ser refletidas nos arquivos `book/SUMMARY-<lang>.md` e `estrutura.xml`.

### Markdown

#### Formatação

Utilize o formatador [Prettier](https://prettier.io/) com as configurações
padrão, exceto:

- [Prose Wrap](https://prettier.io/docs/en/options.html#prose-wrap): `always`

Os arquivos devem ser verificados com
[markdownlint](https://github.com/markdownlint/markdownlint) e não devem ser
encontrados problemas. Há uma extensão para o Visual Studio Code:
[vscode-markdownlint](https://github.com/DavidAnson/vscode-markdownlint)

#### Referências

Referencie apenas fontes altamente confiáveis, como a documentação oficial de
uma ferramenta.

Exemplos de fontes confiáveis:

- [jQuery Learning Center](https://learn.jquery.com/), pois:
  - É destacado no site oficial do jQuery.
- [Python Docs](https://docs.python.org/), pois:
  - É destacado no site oficial do Python.
- [ISO/IEC 14882:2020](https://www.iso.org/standard/79358.html), pois:
  - É um padrão ISO para a linguagem C++. Não use especificamente essa versão, e
    sim a mais recentemente ratificada.

Exemplos de fontes duvidosas:

- [GeeksforGeeks](https://www.geeksforgeeks.org/), pois:
  - Não é oficial.
  - Apresenta frequentes erros e uso de práticas desencorajadas.

Não é necessário incluir referências para todas as afirmações, mas quando haver
referências, devem estar listadas no final do documento sob o cabeçalho de nível
2 "Referências". A estrutura da lista não segue padrões rígidos, mas deve ser
consistente com as demais.

Aqui está um bom exemplo:

- Padrão C18 ([ISO/IEC 9899:2018](https://www.iso.org/standard/74528.html)):
  - 6.3 Conversions
- [jQuery Core API Documentation](https://api.jquery.com/):
  - [.add()](https://api.jquery.com/add/)
  - [Handling Events](https://learn.jquery.com/events/handling-events/)
  - [Types](https://api.jquery.com/Types/):
    - [Selector](https://api.jquery.com/Types/#Selector)
