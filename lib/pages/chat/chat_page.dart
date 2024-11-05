import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/db/db_helper.dart';
import 'package:whatsapp_clone/db/models/chat_item_model.dart';
import 'package:whatsapp_clone/db/models/user_chat_model.dart';
import 'package:whatsapp_clone/helpers/date_helper.dart';
import 'package:whatsapp_clone/pages/chat/widget/chat_app_bar.dart';
import 'package:whatsapp_clone/pages/chat/widget/input_message.dart';
import 'package:whatsapp_clone/pages/chat/widget/message_item.dart';
import 'package:whatsapp_clone/providers/app_state.dart';
import 'package:whatsapp_clone/ui/color.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();

  List<ChatItem> chatList = [];
  UserChat selectedChat = UserChat(receiverId: 0, phoneNumber: '', name: '', lastMessage: '', lastMessageSentTime: 0, unreadCount: 0);

  void _scrollToBottom() {
    if(_scrollController.hasClients) {
      if (_scrollController.position.maxScrollExtent > _scrollController.position.minScrollExtent) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  _handleSendMessage(String message, UserChat selectedChat) {
    int currentUtcTimeInMillis = DateTime.now().toUtc().millisecondsSinceEpoch;
    DatabaseHelper.instance.insertChat(selectedChat.receiverId, message);
    DatabaseHelper.instance.insertUserChat(
      UserChat(
        id: selectedChat.id,
        receiverId: selectedChat.receiverId, 
        phoneNumber: selectedChat.phoneNumber, 
        name: selectedChat.name, 
        lastMessage: message, 
        lastMessageSentTime: currentUtcTimeInMillis, 
        unreadCount: 0
      ),
      selectedChat.lastMessage.isEmpty
    );

    setState(() {
      chatList.add(
        ChatItem(
          receiverId: selectedChat.receiverId, 
          message: message, 
          sentTime: DateHelper.getCurrentTimeUtcInt(), 
          isFromMe: 1, 
        isRead: 0)
      );
    });
    _scrollToBottom();
  }

  @override
  void initState() {
    super.initState();
    // Fetch appState once during initialization
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final appState = Provider.of<AppState>(context, listen: false);
      List<ChatItem> result = await DatabaseHelper.instance.getChatItems(appState.selectedChat.receiverId);
      setState(() {
        chatList = result;
        selectedChat = appState.selectedChat;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    final receiverName = appState.selectedChat.name;

    return Scaffold(
        appBar: ChatAppBar(title: receiverName),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10
                ),
                color: AppColors.backgroundPrimary,
                child: chatList.isNotEmpty ? ListView.builder(
                  itemCount: chatList.length,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    final message = chatList[index];
                    return MessageItem(
                      text: message.message, 
                      time: message.sentTime, 
                      isSentByMe: message.isFromMe
                    );
                  },
                ) :
                  const Center(
                  child: Text(
                    'start a new chat',
                    style: TextStyle(
                      color: AppColors.textSecondary
                    ),
                  )
                )
              ),
            ),
            InputMessage(onSendMessage:(String message) => _handleSendMessage(message, appState.selectedChat))
          ],
        ),
      );
  }
}