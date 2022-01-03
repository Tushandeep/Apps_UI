import 'package:flutter/material.dart';

import '../../../users/chaters_name.dart';

final List<Widget> otherStories = List.generate(
  10,
  (index) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(width: 10),
      Container(
        height: 110,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: otherChatersName[index]['color'].withOpacity(0.7),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/profile.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                otherChatersName[index]['name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
