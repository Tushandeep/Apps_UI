import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../provider/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  final Size size;
  const SettingsScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AutoSizeText(
              'Settings',
              style: TextStyle(
                fontSize: size.width * 0.08,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: Consumer<ThemeProvider>(
                builder: (_, theme, __) {
                  bool isDark = theme.getTheme() == Brightness.dark;
                  return InkWell(
                    onTap: () {
                      if (isDark) {
                        theme.setTheme(Brightness.light);
                      } else {
                        theme.setTheme(Brightness.dark);
                      }
                    },
                    child: Row(
                      children: [
                        Icon(
                            (isDark)
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                            size: size.width * 0.08),
                        const SizedBox(width: 20),
                        Text(
                          (isDark) ? 'Light Mode' : 'Dark Mode',
                          style: TextStyle(fontSize: size.width * 0.045),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
