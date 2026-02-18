# 💬 Desafio Chat Flutter

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)

Aplicação desenvolvida em **Flutter** com foco em autenticação e chat em tempo real, estruturada seguindo boas práticas de organização, separação de responsabilidades e escalabilidade.

O projeto utiliza **Firebase** para autenticação e serviços de backend, sendo compatível com Android, iOS, Web, Windows, Linux e macOS.

---

## 📱 Funcionalidades

- 🔐 **Autenticação de usuários**
  - Login com e-mail e senha
  - Controle de sessão autenticada
- 💬 **Chat em tempo real**
  - Envio e recebimento de mensagens
  - Modelo de mensagens estruturado
- 🔥 **Integração com Firebase**
  - Firebase Auth
  - Firebase Core
- 🧱 **Arquitetura organizada**
  - Separação por camadas (pages, models, services)
- 🌍 **Multiplataforma**
  - Android, iOS, Web, Windows, Linux e macOS

---

## 🗂️ Estrutura de Pastas

desafio_chat_flutter/
├── android/                    # Configurações específicas do Android
├── ios/                        # Configurações específicas do iOS
├── web/                        # Build e suporte para Web
├── windows/                    # Build para Windows
├── linux/                      # Build para Linux
├── macos/                      # Build para macOS
├── assets/
│   └── imagens/                # Imagens e recursos visuais
├── lib/
│   ├── models/                 # Modelos de dados
│   │   └── message_model.dart
│   ├── pages/                  # Telas da aplicação
│   │   ├── chat/
│   │   │   └── chat_page.dart
│   │   └── login/
│   │       └── login_page.dart
│   ├── services/               # Serviços e regras de negócio
│   │   ├── auth_service.dart
│   │   └── chat_service.dart
│   ├── firebase_options.dart   # Configurações do Firebase
│   └── main.dart               # Arquivo principal da aplicação
├── test/                       # Testes automatizados
├── .gitignore
├── .metadata
├── analysis_options.yaml       # Regras de análise de código
├── flutter_plugins_dependencies
└── pubspec.yaml                # Dependências e configurações do Flutter

---

🧠 Organização da Arquitetura
📦 Models
Responsáveis por representar os dados da aplicação.

message_model.dart: Estrutura das mensagens do chat. Facilita a serialização e desserialização.

🧩 Pages
Contém as telas (UI) da aplicação.

login_page.dart: Tela de login do usuário.

chat_page.dart: Interface principal do chat.

⚙️ Services
Responsáveis pela lógica de negócio e comunicação com serviços externos.

auth_service.dart: Gerenciamento de autenticação.

chat_service.dart: Envio e recebimento de mensagens.

🔥 Configuração do Firebase
Crie um projeto no Firebase Console.

Adicione um app Android.

Baixe o arquivo google-services.json.

Coloque o arquivo em: android/app/google-services.json

Gere o arquivo firebase_options.dart utilizando:

Bash

flutterfire configure
🚀 Como Executar o Projeto Localmente
✅ Pré-requisitos
Flutter instalado (versão estável)

Android Studio ou VS Code

SDK do Android configurado

Emulador ou dispositivo físico

Verifique a instalação:

Bash

flutter doctor
▶️ Rodar o projeto
Bash

flutter pub get
flutter run
📦 Como Gerar o APK para Android
🔹 1. Limpar o projeto (opcional, mas recomendado)
Bash

flutter clean
flutter pub get
🔹 2. Gerar APK de Release
Bash

flutter build apk --release
🔹 3. Local do APK Gerado
Após o build, o APK estará disponível em: build/app/outputs/flutter-apk/app-release.apk

🛠️ Gerar APK com ABI separada (opcional)
Reduz o tamanho do APK:

Bash

flutter build apk --split-per-abi
🧪 Testes
Para rodar os testes automatizados:

Bash

flutter test
📌 Observações Importantes
Certifique-se de que o Firebase esteja corretamente configurado antes do build.

Para publicar na Play Store, será necessário gerar um App Bundle (.aab): flutter build appbundle

👨‍💻 Autor
Luiz Filipe
Engenheiro de Software | Flutter | Mobile | Web

📄 Licença
Este projeto é de uso livre para fins educacionais e avaliativos.


