import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/db/db_helper.dart';
import 'package:whatsapp_clone/db/models/user_chat_model.dart';
import 'package:whatsapp_clone/db/models/user_model.dart';
import 'package:whatsapp_clone/providers/app_state.dart';
import 'package:whatsapp_clone/routes.dart';
import 'package:whatsapp_clone/ui/color.dart';

class SearchResultItem extends StatefulWidget {
  const SearchResultItem({super.key});

 @override
  State<SearchResultItem> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<SearchResultItem> {
  List<User> contactList = []; 

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  Future<void> getContacts() async {
    List<User> contacts = await DatabaseHelper.instance.getContacts();
    setState(() {
      contactList = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {

    final appState = Provider.of<AppState>(context);


    return ListView.builder(
      itemCount: contactList.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Column(
            children: [
              SizedBox(height: 10),
              SizedBox(height: 10),
            ]
          );
        } else {
          
          return InkWell(
            key: ValueKey('contact-list-$index'),
            onTap: () {
              appState.setSelectedChat(
                UserChat(
                  receiverId: contactList[index-1].id ?? 0, 
                  phoneNumber: contactList[index-1].phoneNumber,
                  name: contactList[index-1].name, 
                  lastMessage: '', 
                  lastMessageSentTime: 0,
                  unreadCount: 0
                )
              );
              Navigator.pushNamed(context, AppRoutes.chat);
                Navigator.pushNamed(context, '/chat');
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
                contactList[index-1].name,
                style: const TextStyle(color: AppColors.textPrimary),
              )
            ),
          );
        }
      },
    );
  }
}
