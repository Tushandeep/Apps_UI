import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/data.dart';
import '../../provider/theme_provider.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDark = theme.getTheme() == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark ? darkIconsColor : lightIconsColor,
            ),
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                color: (isDark) ? darkScaffoldColor : lightScaffoldColor,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.primaries[Random().nextInt(7)],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/profile.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Jack',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'I am a Flutter Developer',
                  style: TextStyle(
                    color: isDark ? darkTextColor : lightTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DateFormat('h:mm a').format(
                  DateTime.now(),
                ),
                style: TextStyle(
                  color: isDark ? darkTextColor : lightTextColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? darkIconsColor : lightIconsColor,
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: (isDark) ? darkScaffoldColor : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
