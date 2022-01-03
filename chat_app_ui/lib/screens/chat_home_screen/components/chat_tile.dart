import 'dart:math';

import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../users/chaters_name.dart';

class ChatTile extends StatelessWidget {
  final int index;

  const ChatTile({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _messages = Random().nextInt(7);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 10,
        right: 10,
      ),
      child: Row(
        children: <Widget>[
          // Profile
          CircleAvatar(
            radius: 30,
            backgroundColor: otherChatersName[index]['color'].withOpacity(0.7),
            backgroundImage: const AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(width: 10),
          // Name and message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  otherChatersName[index]['name'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const <Widget>[
                    Icon(
                      Iconsax.tick_circle,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Hi',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Number of messages and Date of last message received
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                DateFormat('h:mm a').format(
                  DateTime.now(),
                ),
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: (_messages != 0)
                      ? Colors.green.withOpacity(0.7)
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${Random().nextInt(7) + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
