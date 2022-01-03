import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/data.dart';
import '../../provider/theme_provider.dart';

class Activities extends StatelessWidget {
  const Activities({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              left: 15,
              right: 15,
            ),
            child: Consumer<ThemeProvider>(
              builder: (_, theme, __) {
                bool isDark = theme.getTheme() == Brightness.dark;
                return Text(
                  'Activities',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: isDark ? darkTextColor : lightTextColor,
                  ),
                );
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                const SizedBox(width: 20),
                ...otherUsersStories,
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
