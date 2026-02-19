💬 Desafio Chat Flutter



Aplicação de chat em tempo real desenvolvida em Flutter, com autenticação segura e integração completa com Firebase.
O projeto segue princípios de arquitetura limpa, visando organização, escalabilidade e manutenção facilitada em múltiplas plataformas.

📖 Descrição
Este projeto implementa uma aplicação multiplataforma de chat com autenticação por e-mail e senha e comunicação em tempo real utilizando serviços do Firebase.
A estrutura foi organizada em camadas (Models, Pages e Services), separando responsabilidades de dados, interface e lógica de negócio.

🎯 Objetivo do Desafio
Construir uma aplicação de chat funcional, escalável e organizada, demonstrando:


Integração com serviços de backend em tempo real


Autenticação segura de usuários


Estruturação em camadas inspirada em Clean Architecture


Suporte multiplataforma com Flutter



🧰 Tecnologias Utilizadas


Flutter


Firebase Authentication


Cloud Firestore


Dart



🏗️ Arquitetura / Estrutura de Pastas
O projeto adota separação clara de responsabilidades inspirada em Clean Architecture:
desafio_chat_flutter/
├── assets/imagens/          # Recursos visuais (logos, ícones)
├── lib/
│   ├── models/              # Modelos de dados (Data Classes)
│   │   └── message_model.dart
│   ├── pages/               # Interface do Usuário (UI)
│   │   ├── chat/            # ChatPage e widgets relacionados
│   │   └── login/           # LoginPage e lógica de entrada
│   ├── services/            # Regras de negócio e integração Firebase
│   │   ├── auth_service.dart
│   │   └── chat_service.dart
│   ├── firebase_options.dart # Configurações auto-geradas do Firebase
│   └── main.dart            # Inicialização da aplicação
├── test/                    # Suite de testes automatizados
└── pubspec.yaml             # Gestão de dependências

Camadas
Models
Representação dos dados da aplicação.
message_model.dart define a estrutura das mensagens e facilita serialização/deserialização com o backend.
Pages (UI)
Camada de apresentação responsável pela interação com o usuário.


Login Page


Validação de credenciais


Autenticação do usuário


Persistência de sessão




Chat Page


Interface de mensagens em tempo real


Listagem dinâmica de mensagens


Envio de mensagens




Services
Camada central de lógica de negócio e integração externa.


Auth Service


Abstração da autenticação Firebase


Login e logout


Gerenciamento de sessão




Chat Service


Comunicação com Cloud Firestore


Streams de mensagens em tempo real


Envio e recebimento de mensagens





▶️ Como Executar o Projeto
Pré-requisitos


Flutter SDK (versão estável)


Android Studio ou VS Code


SDK Android/iOS configurado


Conta Firebase ativa


Configuração do Firebase


Criar um projeto no Firebase Console


Adicionar aplicativo (Android / iOS / Web)


Baixar o arquivo google-services.json


Colocar em:


android/app/google-services.json



Gerar configurações globais do Firebase:


flutterfire configure

Execução local
flutter pub get
flutter run

Build Android
ObjetivoComandoLimpar buildflutter cleanGerar APK releaseflutter build apk --releaseAPK por ABIflutter build apk --split-per-abiApp Bundle (Play Store)flutter build appbundle
Local do APK gerado
build/app/outputs/flutter-apk/app-release.apk


🧪 Como Executar os Testes
Execução da suíte de testes automatizados:
flutter test


⚙️ Decisões Técnicas


Arquitetura em camadas inspirada em Clean Architecture para separação de responsabilidades


Firebase como backend serverless para autenticação e tempo real


Streams do Firestore para atualização automática de mensagens


Organização modular por feature (login/chat) dentro da camada de UI



🚀 Possíveis Melhorias


Implementação de gerenciamento de estado dedicado (ex.: Provider, Riverpod, Bloc)


Suporte a anexos e mídia no chat


Testes de integração e testes de widget


Tratamento avançado de erros e estados de rede


Internacionalização (i18n)



👨‍💻 Autor
Luiz Filipe
Engenheiro de Software

📄 Licença
Este projeto é disponibilizado para fins educacionais e avaliativos.
