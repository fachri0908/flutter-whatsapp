import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/db/models/user_chat_model.dart';
import 'package:whatsapp_clone/helpers/date_helper.dart';
import 'package:whatsapp_clone/pages/home/widget/chat/chat_categories.dart';
import 'package:whatsapp_clone/providers/app_state.dart';
import 'package:whatsapp_clone/routes.dart';
import 'package:whatsapp_clone/ui/color.dart';

class ChatList extends StatelessWidget {
  final List<UserChat> chatList;
  
  const ChatList({
    super.key,
    required this.chatList
  });

  @override
  Widget build(BuildContext context) {

    final appState = Provider.of<AppState>(context);

    return ListView.builder(
      itemCount: chatList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Column(
            children: [
              SizedBox(height: 10),
              ChatCategories(),
              SizedBox(height: 10),
            ]
          );
        } else {
          
        return InkWell(
          key: ValueKey('chat-list-$index'),
          onTap: () {
            appState.setSelectedChat(chatList[index-1]);
            Navigator.pushNamed(context, AppRoutes.chat);
          },
          splashColor: Colors.white,
          child: ListTile(
            contentPadding:
                const EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
            leading: const Icon(
              Icons.supervised_user_circle_outlined,
              size: 64,
            ),
            title: Text(
              chatList[index-1].name,
              style: const TextStyle(color: AppColors.textPrimary),
            ),
            subtitle: Text(
              chatList[index-1].lastMessage,
              style: const TextStyle(color: Color(0xff9FA2A7)),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateHelper.formatIntDateToHourOnly(chatList[index-1].lastMessageSentTime),
                  style: TextStyle(
                    color: chatList[index-1].unreadCount > 0 ? AppColors.textHighlighted : AppColors.textSecondary
                  ),
                ),
                if (chatList[index-1].unreadCount > 0) Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: AppColors.textHighlighted,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    chatList[index-1].unreadCount.toString(),
                    style: const TextStyle(
                      color: Color(0xff232D36),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        }
      },
    );
  }
}
