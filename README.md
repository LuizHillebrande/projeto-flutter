# Saborê — Aplicativo de Receitas

O Saborê é um aplicativo de receitas desenvolvido em Flutter como atividade acadêmica. A ideia é permitir que o usuário consulte receitas, pesquise pelo nome, veja os ingredientes e o modo de preparo e salve suas receitas favoritas.

## Funcionalidades

- Listagem de receitas obtidas pela API DummyJSON.
- Pesquisa de receitas pelo nome.
- Validação de pesquisa vazia e opção para limpar a pesquisa.
- Tela de detalhes com ingredientes, instruções e informações disponíveis da receita.
- Adição e remoção de receitas favoritas durante a sessão.
- Mensagens de carregamento, erro e ausência de resultados.
- Navegação entre as telas de explorar, pesquisa, detalhes e favoritos.

## Tecnologias e dependências

- Flutter
- Dart
- Pacote `http` para realizar as requisições HTTP.
- API utilizada: [DummyJSON Recipes](https://dummyjson.com/docs/recipes)

## SDK utilizado

- Flutter SDK: 3.47.8
- Dart SDK: 3.13.7

As versões acima correspondem ao ambiente de desenvolvimento utilizado. Para conferir as versões instaladas no computador, execute `flutter --version` no terminal.

## Como executar o projeto

1. Instale o Flutter SDK e configure o ambiente de desenvolvimento.
2. Clone este repositório ou baixe os arquivos do projeto.
3. Abra a pasta do projeto no VS Code ou em outra IDE compatível com Flutter.
4. No terminal, execute:

   ```bash
   flutter pub get
   ```

5. Inicie um emulador ou conecte um dispositivo compatível.
6. Execute o aplicativo:

   ```bash
   flutter run
   ```

É necessário ter conexão com a internet para carregar e pesquisar receitas na API.

## Organização do código

- `main.dart`: inicia o aplicativo.
- `Principal.dart`: configura o aplicativo, carrega as receitas e mantém os favoritos durante a sessão.
- `Perfil.dart`: apresenta a tela de explorar e a lista de receitas.
- `Resultado.dart`: realiza a pesquisa e apresenta os resultados.
- `Detalhes.dart`: apresenta os ingredientes e o modo de preparo.
- `Favoritos.dart`: apresenta as receitas marcadas como favoritas.
- `models/receita.dart`: define a estrutura dos dados de uma receita.
- `services/receita_api.dart`: realiza as requisições à API.
- `widgets/CartaoReceita.dart`: componente reutilizado para exibir as receitas.

## Observação

Os favoritos são mantidos em memória durante a sessão. Ao fechar o aplicativo, eles não ficam salvos permanentemente.
