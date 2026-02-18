class MessageModel {
  final String user;
  final String text;
  final DateTime createdAt;

  MessageModel({
    required this.user,
    required this.text,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<dynamic, dynamic> map) {
    return MessageModel(
      user: map['user'],
      text: map['text'],
      createdAt:
          DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }
}
