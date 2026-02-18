
import 'package:desafio_chat_flutter/pages/chat/chat_page.dart';
import 'package:desafio_chat_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = TextEditingController();
  final auth = AuthService();

  void login() async {
    if (controller.text.isEmpty) return;
    
    await auth.login(controller.text);
    
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (_) => ChatPage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: login,
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}