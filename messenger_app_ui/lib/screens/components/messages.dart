import 'package:flutter/material.dart';
import 'package:messenger_app_ui/constants/data.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import './chat_tile.dart';

class Messages extends StatelessWidget {
  const Messages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<ThemeProvider>(
              builder: (_, theme, __) {
                bool isDark = theme.getTheme() == Brightness.dark;
                return Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: isDark ? darkTextColor : lightTextColor,
                  ),
                );
              },
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  ...List.generate(
                    10,
                    (index) => const ChatTile(),
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
