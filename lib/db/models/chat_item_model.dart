class ChatItem {
  final int? id;
  final int receiverId;
  final String message;
  final int sentTime;
  final int isFromMe;
  final int isRead;

  const ChatItem({
    this.id, 
    required this.receiverId,
    required this.message,
    required this.sentTime,
    required this.isFromMe,
    required this.isRead,
  });

  // Convert a User object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'receiverId': receiverId,
      'message': message,
      'sentTime': sentTime,
      'isFromMe': isFromMe,
      'isRead': isRead
    };
  }

  // Extract a User object from a Map object
  factory ChatItem.fromMap(Map<String, dynamic> map) {
    return ChatItem(
      id: map['id'],
      receiverId: map['receiverId'],
      message: map['message'],
      sentTime: map['sentTime'],
      isFromMe: map['isFromMe'],
      isRead: map['isRead'],
    );
  }
}