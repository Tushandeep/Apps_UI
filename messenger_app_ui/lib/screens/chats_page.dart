import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_app_ui/constants/data.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';
import './components/activities.dart';
import './components/messages.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({
    Key? key,
    required this.size,
    required TextEditingController searchController,
  })  : _searchController = searchController,
        super(key: key);

  final Size size;
  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.21,
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Consumer<ThemeProvider>(builder: (_, theme, __) {
            bool isDark = theme.getTheme() == Brightness.dark;
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.05,
                        color: (isDark) ? darkTextColor : lightTextColor,
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.edit,
                      color: (isDark) ? darkIconsColor : lightIconsColor,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _searchController,
                  cursorColor: Colors.grey,
                  style: TextStyle(
                    color: (isDark) ? darkBarIcons : lightBarIcons,
                  ),
                  decoration: InputDecoration(
                    constraints: BoxConstraints.tight(
                      Size(
                        double.infinity,
                        size.height * 0.062,
                      ),
                    ),
                    hintStyle: const TextStyle(
                      color: lightTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: 'Search',
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: lightTextColor,
                    ),
                    fillColor: lightBarIcons.withOpacity(0.2),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Activities(size: size),
              const SizedBox(height: 15),
              const Messages(),
            ],
          ),
        ),
      ],
    );
  }
}
