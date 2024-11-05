import 'package:flutter/material.dart';
import 'package:whatsapp_clone/db/db_helper.dart';
import 'package:whatsapp_clone/db/models/user_chat_model.dart';
import 'package:whatsapp_clone/db/models/user_model.dart';

class AppState extends ChangeNotifier {
  User _user = User(id: 0, name: '', phoneNumber: '');
  User get user => _user;

  UserChat _selectedChat = UserChat(receiverId: 0, phoneNumber: '', name: '', lastMessage: '', lastMessageSentTime: 0, unreadCount: 0);
  UserChat get selectedChat => _selectedChat;

  List<User> _contacts = [];
  List<User> get contacts => _contacts;

  void setSelectedChat(UserChat selectedChat) {
    _selectedChat = selectedChat;
    notifyListeners(); // Notifies all widgets listening to this state
  }

  void setUser(User userData) {
    _user = userData;
    notifyListeners(); // Notifies all widgets listening to this state
  }

  void setContacts(List<User> contacts) {
    _contacts = contacts;
    notifyListeners(); // Notifies all widgets listening to this state
  }

  Future<void> fetchUserProfile() async {
    // Simulate a delay for fetching user data
    await Future.delayed(const Duration(seconds: 2));
    
    DatabaseHelper.instance.getUsers().then((List<User> userProfile) => {
      setUser(userProfile[0])
    });

    notifyListeners(); // Notify widgets to rebuild with new user data
  }

  Future<void> fetchUserContacts() async {
    // Simulate a delay for fetching user data
    await Future.delayed(const Duration(seconds: 2));
    
    DatabaseHelper.instance.getContacts().then((List<User> contacts) => {
      setContacts(contacts)
    });

    notifyListeners(); // Notify widgets to rebuild with new user data
  }
}
