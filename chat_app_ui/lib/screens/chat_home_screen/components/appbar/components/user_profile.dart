import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      height: 100,
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.7),
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Good Morning',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Christian',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Iconsax.search_normal,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Iconsax.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
