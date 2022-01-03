import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messenger_app_ui/constants/data.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import '../provider/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MessengerUI(),
    );
  }
}

class MessengerUI extends StatelessWidget {
  const MessengerUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: theme.getTheme(),
        scaffoldBackgroundColor: (theme.getTheme() == Brightness.dark)
            ? darkScaffoldColor
            : lightScaffoldColor,
      ),
    );
  }
}
