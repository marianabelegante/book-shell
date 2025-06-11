BookShelf App (Versão com GetX)
Este é um mini-aplicativo em Flutter que consome a API de best-sellers do New York Times e permite que usuários autenticados com Firebase salvem seus livros favoritos.

Funcionalidades
Autenticação com Firebase: Cadastro e Login usando E-mail e Senha.

Consumo de API: Busca e exibe a lista de livros best-sellers de ficção.

Sistema de Favoritos (Em Memória): Permite favoritar e desfavoritar livros.

Gerenciamento de Estado com GetX: Usa GetxController e Obx para um estado reativo e simples.

Gerenciamento de Rotas com GetX: Rotas nomeadas gerenciadas pelo GetX.

Arquitetura MVC: O projeto segue o padrão Model-View-Controller.

Como Executar o Projeto
1. Pré-requisitos
Flutter SDK instalado.

Uma conta no Firebase.

A chave da API do New York Times já está no código.

2. Configuração do Firebase
Crie um novo projeto no console do Firebase.

Adicione um aplicativo Android e/ou iOS ao seu projeto Firebase. Siga as instruções para baixar o arquivo de configuração (google-services.json para Android e GoogleService-Info.plist para iOS) e coloque-o na pasta correta do seu projeto Flutter (android/app/ e ios/Runner/).

Na seção Authentication do console do Firebase, clique em "Começar" e habilite o provedor de E-mail/Senha.

Instale a CLI do FlutterFire: dart pub global activate flutterfire_cli.

No terminal, na raiz do seu projeto Flutter, execute flutterfire configure. Selecione o projeto Firebase que você criou para gerar automaticamente o arquivo lib/firebase_options.dart.

3. Rodando o App
Clone este repositório ou crie os arquivos conforme a estrutura fornecida.

Crie as pastas: lib/controller, lib/model, lib/service, lib/view, lib/routes.

Coloque cada arquivo na sua respectiva pasta.

Execute flutter pub get no terminal para instalar as dependências.

Conecte um dispositivo ou inicie um emulador.

Execute flutter run para iniciar o aplicativo.

Nota sobre o CORS: O BookService utiliza um proxy (cors-anywhere) para evitar erros de CORS durante o teste no navegador (Flutter Web). Isso não é necessário para emuladores Android/iOS, mas garante que funcione em todas as plataformas durante o desenvolvimento.