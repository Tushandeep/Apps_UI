import 'package:flutter/material.dart';

import 'screens/chat_home_screen/chat_home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ChatHomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}
