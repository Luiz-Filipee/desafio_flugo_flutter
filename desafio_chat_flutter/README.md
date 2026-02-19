# 💬 Desafio Chat Flutter

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-blue)

Aplicação de chat em tempo real desenvolvida em **Flutter**, com autenticação segura e integração completa com **Firebase**.  
O projeto segue princípios de **arquitetura limpa**, visando organização, escalabilidade e manutenção facilitada em múltiplas plataformas.

---

## 📖 Descrição

Este projeto implementa uma aplicação multiplataforma de chat com autenticação por e-mail e senha e comunicação em tempo real utilizando serviços do Firebase.  
A estrutura foi organizada em camadas (Models, Pages e Services), separando responsabilidades de dados, interface e lógica de negócio.

---

## 🎯 Objetivo do Desafio

Construir uma aplicação de chat funcional, escalável e organizada, demonstrando:

- Integração com serviços de backend em tempo real  
- Autenticação segura de usuários  
- Estruturação em camadas inspirada em Clean Architecture  
- Suporte multiplataforma com Flutter  

---

# 📱 Funcionalidades

| Categoria | Descrição |
| :--- | :--- |
| **Autenticação** | Login seguro via e-mail/senha com persistência de sessão |
| **Tempo Real** | Envio e recebimento instantâneo de mensagens |
| **Backend** | Integração completa com Firebase Auth e Cloud Services |
| **Arquitetura** | Estruturação em camadas (Pages, Models, Services) |
| **Multiplataforma** | Suporte para Android, iOS, Web e Desktop |

---

## 🧰 Tecnologias Utilizadas

- Flutter
- Firebase Authentication
- Cloud Firestore
- Realtime Database
- Dart

---

## 🏗️ Arquitetura / Estrutura de Pastas


  # 🗂️ Estrutura de Pastas

  ```bash
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
```

---

## 🔥 Organização da Arquitetura

O projeto segue uma divisão clara de responsabilidades inspirada em Clean Architecture, separando dados, interface e regras de negócio.

---

## 📦 Models

Responsáveis pela representação dos dados da aplicação.
O arquivo **message_model.dart** define a estrutura das mensagens e facilita a serialização e desserialização de dados vindos do backend.

---

## 🧩 Pages (UI)

Camada de apresentação responsável pela interação com o usuário.

### Login Page
- **Validação de credenciais**
- **Autenticação do usuário**
- **Persistência de sessão**

### Chat Page
- **Interface de mensagens em tempo real**
- **Listagem dinâmica de mensagens**
- **Envio de mensagens**

---

## ⚙️ Services

Camada central da lógica de negócio e integração externa.

### Auth Service
- **Abstração da autenticação Firebase**
- **Login e logout**
- **Gerenciamento de sessão**

### Chat Page
- **Comunicação com Cloud Firestore**
- **Streams de mensagens em tempo real**
- **Envio e recebimento de mensagens**

---

## 🔥 Configuração do Firebase

1. **Criar um projeto no Firebase Console**
2. **Adicionar aplicativo (Android / iOS / Web)**
3. **Baixar o arquivo google-services.json**
4. **Colocar em:**

```
android/app/google-services.json
```

5. **Gerar configurações globais do Firebase:**

```
flutterfire configure
```

---

## 🚀 Guia de Execução

### ✅ Pré-requisitos

- **Flutter SDK (versão estável)**
- **Android Studio ou VS Code**
- **SDK Android/iOS configurado**
- **Conta Firebase ativa**

### ▶️ Rodar Localmente

```
flutter pub get
flutter run
```

---

## 📦 Build e Distribuição (Android)

- **Objetivo** | **Comando**
- Limpar build	`flutter clean`
- Gerar APK release	`flutter build apk --release`
- APK separado por ABI	`flutter build apk --split-per-abi`
- App Bundle (Play Store)	`flutter build appbundle`

### Local do APK gerado:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 👨‍💻 Autor

### Luiz Filipe
**Engenheiro de Software**

---

## 📄 Licença

Este projeto é disponibilizado para fins educacionais e avaliativos.

