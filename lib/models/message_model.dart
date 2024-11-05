class Message {
  final String sender;
  final String text;
  final String time;
  final bool isSentByMe;

  Message({
    required this.sender,
    required this.text,
    required this.time,
    required this.isSentByMe,
  });
}