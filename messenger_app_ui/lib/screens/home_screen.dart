import 'package:flutter/material.dart';
import 'package:messenger_app_ui/constants/data.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import './chats_page.dart';
import './calls_page.dart';
import './camera.dart';
import './settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDark = theme.getTheme() == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          [
            ChatsScreen(size: size, searchController: _searchController),
            const CallsScreen(),
            const CameraScreen(),
            SettingsScreen(size: size),
          ][_selectedIndex],
          Container(
            height: 80,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: isDark
                    ? const Color.fromARGB(255, 61, 64, 87)
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(width: 25),
                  Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Icon(
                          Icons.message_outlined,
                          color: (_selectedIndex == 0)
                              ? (isDark)
                                  ? darkIconsColor
                                  : lightIconsColor
                              : (isDark)
                                  ? darkBarIcons
                                  : lightBarIcons,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(
                    3,
                    (index) => _buildIcon(index + 1, isDark),
                  ),
                  const SizedBox(width: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(int index, bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 30),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Icon(_icons[index - 1],
              size: 30,
              color: (_selectedIndex == index)
                  ? (isDark)
                      ? darkIconsColor
                      : lightIconsColor
                  : (isDark)
                      ? darkBarIcons
                      : lightBarIcons),
        ),
      ],
    );
  }

  final _icons = [
    Icons.call_outlined,
    Icons.camera_alt_outlined,
    Icons.settings_outlined,
  ];
}
