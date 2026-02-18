# 💬 Desafio Chat Flutter

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-blue)

Aplicação robusta desenvolvida em **Flutter** com foco em autenticação segura e comunicação em tempo real. O projeto segue padrões de arquitetura limpa, garantindo escalabilidade e facilidade de manutenção em múltiplas plataformas.

---

## 📱 Funcionalidades

- 🔐 Autenticação de usuários
  - Login com e-mail e senha
  - Controle de sessão autenticada
- 💬 Chat em tempo real
  - Envio e recebimento de mensagens
  - Modelo de mensagens estruturado
- 🔥 Integração com Firebase
  - Firebase Auth
  - Firebase Core
- 🧱 Arquitetura organizada
  - Separação por camadas (pages, models, services)
- 🌍 Multiplataforma
  - Android, iOS, Web, Windows, Linux e macOS

## 📁 Estrutura do Projeto

```bash
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
```

---

## 🧠 Organização da Arquitetura

* Banco: **Firestore**
* Coleção: `colaboradores`

### Estrutura do documento

```ts
{
  nome: string;
  email: string;
  departamento: string;
  ativo: boolean;
  criadoEm: Timestamp;
}
```

* Banco: **Firestore**
* Coleção: `departamentos`

### Estrutura do documento

```ts
{
  id?: string;
  nome: string;
  gestorId: string;
  gestorNome: string;
  colaboradores: string[];
  ativo: boolean;
}
```

---

## ▶️ Como Rodar o Projeto Localmente

### 1️⃣ Clonar o repositório

```bash
git clone https://github.com/seu-usuario/flugo.git
cd flugo
```

### 2️⃣ Instalar dependências

```bash
npm install
```

### 3️⃣ Configurar Firebase

Crie um arquivo:

```bash
src/services/firebase.ts
```

E adicione suas credenciais:

```ts
import { initializeApp } from 'firebase/app';
import { getFirestore } from 'firebase/firestore';
import { getAuth } from 'firebase/auth';

const firebaseConfig = {
  apiKey: "SUA_API_KEY",
  authDomain: "SEU_DOMINIO",
  projectId: "SEU_PROJECT_ID",
  storageBucket: "SEU_BUCKET",
  messagingSenderId: "SEU_ID",
  appId: "SEU_APP_ID",
};

const app = initializeApp(firebaseConfig);
export const auth = getAuth(app); 
export const db = getFirestore(app);
```

### 4️⃣ Rodar o projeto

```bash
npm run dev
```

Acesse:

```
http://localhost:5173
```

---

## 🌍 Deploy

O projeto foi buildado e publicado na **Vercel**.

🔗 **Link:** [https://desafio-flugo-uskz.vercel.app/](https://SEU-LINK-DO-VERCEL-AQUI)

---

## 🧪 Testes Manuais Sugeridos

### 🔐 Autenticação
- Acessar rota protegida sem estar logado → redireciona para login
- Criar conta com e-mail inválido → erro exibido
- Criar conta com campos vazios → botão desabilitado
- Login com credenciais inválidas → mensagem de erro
- Login válido → redirecionamento para tela de colaboradores
- Logout → token removido do `localStorage` e redirecionamento para login

---

### 👥 Colaboradores
- Criar colaborador sem e-mail → botão **Concluir** desabilitado
- Criar colaborador com e-mail inválido → erro visual
- Criar colaborador sem nome → botão desabilitado
- Criar colaborador válido → redirecionamento automático
- Editar colaborador existente → dados pré-carregados
- Alterar status para **Inativo** → colaborador não aparece em seleções
- Exclusão lógica (ativo = false) → colaborador não removido do banco
- Transferir colaborador para outro departamento
- Garantir regra: colaborador **nunca fica sem departamento**
- Alterar nível hierárquico (colaborador ↔ gestor)

---

### 🏢 Departamentos
- Criar departamento sem nome → botão desabilitado
- Criar departamento sem gestor → botão desabilitado
- Criar departamento válido → redirecionamento automático
- Editar departamento → dados pré-carregados
- Adicionar colaborador existente ao departamento
- Visualizar lista de colaboradores do departamento
- Transferir colaborador para outro departamento via modal
- Verificar sincronização:
  - Departamento → lista de colaboradores
  - Colaborador → departamento atualizado
- Garantir que gestor seja sempre um colaborador válido

---

### 🧭 Navegação & UI
- Expandir e recolher menus da sidebar
- Navegar entre telas sem perder estado
- Verificar destaque correto do menu ativo
- Testar botões desabilitados quando formulário inválido
- Validar feedback visual de loading
- Conferir Snackbars de sucesso e erro
- Acessar rota inexistente → tela **Not Found**

---

### 📊 Listagens
- Ordenar lista de colaboradores por:
  - Nome
  - E-mail
  - Status
- Listar apenas colaboradores ativos nos selects
- Conferir atualização imediata após salvar/editar

---

## 📌 Próximas Melhorias (Roadmap)

* 🔐 Autenticação (Firebase Auth)
* 👤 Perfis e permissões
* 🔍 Busca e filtros avançados
* 📊 Dashboard com métricas
* 📱 Responsividade mobile

---

## 👨‍💻 Autor

**Luiz Filipe**
Desenvolvedor Frontend & Software Engineer

📎 LinkedIn: [https://linkedin.com/in/luizfilipemkato](https://linkedin.com/in/luizfilipemkato)
📎 GitHub: [https://github.com/Luiz-Filipee](https://github.com/Luiz-Filipee)

---

⭐ Se esse projeto te ajudou ou inspirou, deixe uma estrela no repositório!
