import 'package:flutter/material.dart';

import './components/stories.dart';
import './components/user_profile.dart';

class ProfileAndStories extends StatelessWidget {
  const ProfileAndStories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        children: const <Widget>[
          SizedBox(height: 30),
          UserProfile(),
          Stories(),
        ],
      ),
    );
  }
}
