import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_provider.dart';

final otherUsersStories = List.generate(
  8,
  (index) => Builder(builder: (context) {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDark = theme.getTheme() == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(height: 5),
            Text(
              'Jack',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: isDark ? darkTextColor : lightTextColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }),
);

const Color darkTextColor = Color.fromARGB(255, 216, 208, 208);
const Color lightTextColor = Color.fromARGB(255, 134, 127, 127);
const Color darkBarIcons = Color.fromARGB(255, 196, 190, 190);
const Color lightBarIcons = Colors.grey;
const Color lightIconsColor = Colors.green;
const Color darkIconsColor = Colors.greenAccent;
const Color darkScaffoldColor = Color(0xFF181829);
const Color lightScaffoldColor = Colors.white;
