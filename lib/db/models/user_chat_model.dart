class UserChat {
  final int? id;
  final int receiverId;
  final String phoneNumber;
  final String name;
  final String lastMessage;
  final int lastMessageSentTime;
  final int unreadCount;

  UserChat({
    this.id, 
    required this.receiverId,
    required this.phoneNumber,
    required this.name,
    required this.lastMessage,
    required this.lastMessageSentTime,
    required this.unreadCount
  });

  // Convert a User object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'receiverId': receiverId,
      'phoneNumber': phoneNumber,
      'name': name,
      'lastMessage': lastMessage,
      'lastMessageSentTime': lastMessageSentTime,
      'unreadCount': unreadCount
    };
  }

  // Extract a User object from a Map object
  factory UserChat.fromMap(Map<String, dynamic> map) {
    return UserChat(
      id: map['id'],
      receiverId: map['receiverId'],
      phoneNumber: map['phoneNumber'],
      name: map['name'],
      lastMessage: map['lastMessage'],
      lastMessageSentTime: map['lastMessageSentTime'],
      unreadCount: map['unreadCount']
    );
  }
}