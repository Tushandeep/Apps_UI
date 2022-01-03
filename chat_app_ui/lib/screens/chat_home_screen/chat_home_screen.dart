import 'package:flutter/material.dart';

import './components/chats_list_view.dart';
import 'components/appbar/profile_and_stories.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 236, 236),
      body: Column(
        children: const <Widget>[
          // appbar with Profile and stories....
          ProfileAndStories(),

          // chat List View....................
          Expanded(
            child: ChatsList(),
          ),
        ],
      ),
    );
  }
}
