import 'package:condoview/screens/conversas/coversations_screen.dart';
import 'package:flutter/material.dart';
import 'package:condoview/screens/conversas/chat_screen.dart';
import 'package:condoview/screens/home/home_screen.dart';
import 'package:condoview/screens/search/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/conversas': (context) => ConversationsScreen(),
        '/chat': (context) => ChatScreen(name: 'Nome'),
        '/search': (context) => SearchScreen(),
      },
    );
  }
}
