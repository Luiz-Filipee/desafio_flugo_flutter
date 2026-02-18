import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final DatabaseReference messagesRef =
    FirebaseDatabase.instance.ref('messages');

  final TextEditingController messageController =
    TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    messagesRef.push().set({
      'user': FirebaseAuth.instance.currentUser!.email,
      'text': messageController.text.trim(),
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    });

    messageController.clear();
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!.email;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF2ECC71),
        title: const Text('Chat Geral', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: messagesRef.onValue,
              builder: (context, snapshot) {
                if (!snapshot.hasData ||
                  snapshot.data!.snapshot.value == null) {
                  return const Center(
                    child: Text('Nenhuma mensagem')
                  );
                }

                final data = Map<dynamic, dynamic>.from(
                  snapshot.data!.snapshot.value as Map);

                final messages = data.entries.toList()
                  ..sort((a, b) {
                    final aTime = a.value['createdAt'] ?? 0;
                    final bTime = b.value['createdAt'] ?? 0;
                    return aTime.compareTo(bTime);
                  });


                scrollToBottom();

                return ListView.builder(
                  controller: scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index].value;
                    final isMe = msg['user'] == currentUser;

                    final time = DateTime
                      .fromMillisecondsSinceEpoch(
                        msg['createdAt']);

                    return Align(
                      alignment: isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                        padding: const EdgeInsets.all(12),
                        constraints: const BoxConstraints(
                          maxWidth: 280),
                        decoration: BoxDecoration(
                          color: isMe
                            ? const Color(0xFF2ECC71)
                            : Colors.white,
                          borderRadius:
                            BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              msg['user'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isMe
                                  ? Colors.white
                                  : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              msg['text'],
                              style: TextStyle(
                                color: isMe
                                  ? Colors.white
                                  : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Align(
                              alignment:
                                  Alignment.bottomRight,
                              child: Text(
                                '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: isMe
                                    ? Colors.white70
                                    : Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send,
                      color: Color(0xFF27AE60)),
                  onPressed: sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
