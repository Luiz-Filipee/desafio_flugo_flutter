class MessageModel {
  final String texto;
  final String userName;
  final String userId;
  final DateTime timestamp;

  MessageModel({
    required this.texto,
    required this.userName,
    required this.userId,
    required this.timestamp,
  });

  factory MessageModel.fromMap(Map data) {
    return MessageModel(
      texto: data['texto'],
      userName: data['userName'],
      userId: data['userId'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'texto': texto,
      'userName': userName,
      'userId': userId,
      'timestamp': timestamp,
    };
  }
}