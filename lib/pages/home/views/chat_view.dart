import 'package:flutter/material.dart';
import 'package:whatsapp_clone/db/db_helper.dart';
import 'package:whatsapp_clone/db/models/user_chat_model.dart';
import 'package:whatsapp_clone/observers/route_observers.dart';
import 'package:whatsapp_clone/pages/home/widget/chat/chat_list.dart';
import 'package:whatsapp_clone/ui/color.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
  });
  
  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> with RouteAware{

  List<UserChat> chatList = [];

  @override
  void initState() {
    super.initState();
    getUserChatList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    getUserChatList();
  }

  Future<void> getUserChatList() async {
    List<UserChat> chats = await DatabaseHelper.instance.getUserChats();
    setState(() {
      chatList = chats;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      child: ChatList(chatList: chatList)
    );
  }
}
