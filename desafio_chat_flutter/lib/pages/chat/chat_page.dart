
import 'package:desafio_chat_flutter/models/message_model.dart';
import 'package:desafio_chat_flutter/services/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatService = ChatService();
  final controller = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  void enviar() async {
    if (controller.text.isEmpty) return;

    final mensagem = MessageModel(
      texto: controller.text,
      userName: user?.displayName ?? 'Anônimo',
      userId: user?.uid ?? '',
      timestamp: DateTime.now(),
    );

    chatService.enviaMensagem(mensagem);
    controller.clear();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Geral')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: chatService.getMensagens(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const SizedBox();

                final data = snapshot.data!.snapshot.value as Map?;
                if (data == null) return const SizedBox();

                final messages = data.entries.map((e) {
                  return MessageModel.fromMap(e.value);
                }).toList();

                return ListView(
                  reverse: false,
                  children: messages.map((m) {
                    final isMe = m.userId == user!.uid;
                    return Align(
                      alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.green[200] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              m.userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            Text(m.texto),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration:
                        const InputDecoration(hintText: 'Digite a mensagem'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: enviar,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}