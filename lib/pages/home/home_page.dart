import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:whatsapp_clone/components/bottom_menu_bar.dart';
import 'package:whatsapp_clone/components/main_app_bar.dart';
import 'package:whatsapp_clone/db/db_helper.dart';
// import 'package:whatsapp_clone/db/db_helper.dart';
import 'package:whatsapp_clone/db/models/user_chat_model.dart';
import 'package:whatsapp_clone/pages/home/views/call_view.dart';
import 'package:whatsapp_clone/pages/home/views/chat_view.dart';
import 'package:whatsapp_clone/pages/home/views/search_result_view.dart';
// import 'package:whatsapp_clone/providers/app_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedMenu = 0;
  List<UserChat> chatList = [];

  @override
  void initState() {
    super.initState();
    // DatabaseHelper.instance.getUsers();
    // Provider.of<AppState>(context).fetchUserProfile();
    // DatabaseHelper.instance.insertUser();
    // DatabaseHelper.instance.generateContacts();
  }

  @override
  Widget build(BuildContext context) {

  void setSelectedMenu (int selectedIndex) async {
    setState(() {
      selectedMenu = selectedIndex;
    });
  }

  Widget renderSelectedView (int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const ChatView(key: ValueKey('chat_view'));
      case 1:
        return const CallView(key: ValueKey('call_view'));
      case 2:
        return const SearchResultView(key: ValueKey('search_result_view'));
      case 3:
        return const CallView(key: ValueKey('call_view'));
      default: return const ChatView(key: ValueKey('chat_view'));
    }
  }

    return Scaffold(
      appBar: MainAppBar(selectedMenu: selectedMenu),
      body: PopScope(
        canPop: selectedMenu != 0 ? false : true,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if(selectedMenu != 0) {
            setState(() {
              selectedMenu=0;
            });
          }else {
            Navigator.of(context).pop();
          }
        },
        child: Column(
          children: [
            Expanded(
              child: renderSelectedView(selectedMenu)
            ),
            BottomMenuBar(
              onMenuTap: setSelectedMenu,
              selectedMenu: selectedMenu,
            )
          ],
        ) 
      )
    );
  }
}
