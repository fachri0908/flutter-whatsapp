import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/providers/app_state.dart'; // Adjust the import as needed

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfLoggedIn();
    });
  }

  void _checkIfLoggedIn() {
    // Provider.of<AppState>(context).fetchUserProfile();

    final appState = Provider.of<AppState>(context, listen: false); // Accessing the provider
    if (appState.user.name.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppState>(context).fetchUserProfile();
    // Show a loading indicator while navigating
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
