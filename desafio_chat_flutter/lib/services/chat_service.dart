import 'package:firebase_database/firebase_database.dart';
import '../models/message_model.dart';

class ChatService {
  final _db = FirebaseDatabase.instance.ref('messages');

  Stream<DatabaseEvent> getMensagens() {
    return _db.orderByChild('timestamp').onValue;
  }

  Future<void> enviaMensagem(MessageModel message) async {
    await _db.push().set(message.toMap());
  }
}