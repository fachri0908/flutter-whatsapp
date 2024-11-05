import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/db/db_helper.dart';
import 'package:whatsapp_clone/firebase_options.dart';
import 'package:whatsapp_clone/observers/route_observers.dart';
import 'package:whatsapp_clone/pages/call/call_page.dart';
import 'package:whatsapp_clone/pages/chat/chat_page.dart';
import 'package:whatsapp_clone/pages/home/home_page.dart';
import 'package:whatsapp_clone/pages/login/login_page.dart';
import 'package:whatsapp_clone/pages/splash/splash_screen.dart';
// import 'package:whatsapp_clone/pages/splash/splash_screen.dart';
// import 'package:whatsapp_clone/pages/login/login_page.dart';
import 'package:whatsapp_clone/providers/app_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseAuth.instance.signInAnonymously();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> getInitialRoute() async {
    final user = await DatabaseHelper.instance.getUsers();
    return user.isNotEmpty ? '/' : '/login';
  }

  @override
  Widget build(BuildContext context) {    
    Provider.of<AppState>(context).fetchUserProfile();

    return MaterialApp(
      navigatorObservers: [routeObserver],
      initialRoute: AppRoutes.home,
      // home: FutureBuilder(
      //   future: getInitialRoute(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const SplashScreen(); // Show loading indicator while checking
      //     }
      //     if (snapshot.hasData) {
      //       return Navigator(
      //         initialRoute: snapshot.data as String,
      //         onGenerateRoute: (RouteSettings settings) {
      //           switch (settings.name) {
      //             case AppRoutes.home:
      //               return MaterialPageRoute(builder: (_) => const HomePage());
      //             case AppRoutes.login:
      //               return MaterialPageRoute(builder: (_) => const LoginPage());
      //             // Add other routes here
      //             default:
      //               return null;
      //           }
      //         },
      //       );
      //     } else {
      //       // Fallback if there’s an error
      //       return const LoginPage();
      //     }
      //   },
      // ),
      routes: {
        // AppRoutes.initial: (context) => const InitialPage(),
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.chat: (context) => const ChatPage(),
        AppRoutes.call: (context) => const CallPage(),
        AppRoutes.login: (context) => const LoginPage(),
      },
    );
  }
}
