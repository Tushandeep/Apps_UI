import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './constant.dart';
import './widgets/counter.dart';
import './widgets/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: kBodyTextColor,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _dropDownVal = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  25,
                ),
                border: Border.all(
                  color: const Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                      value: _dropDownVal,
                      items: [
                        'Indonesia',
                        'Bangladesh',
                        'United States',
                      ].map<DropdownMenuItem<String>>(
                        (value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          _dropDownVal = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            'Case Update',
                            style: kTitleTextstyle,
                          ),
                          Text(
                            'Newest update March 28',
                            style: TextStyle(
                              color: kTextLightColor,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "See details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Counter(
                          number: 1046,
                          color: kInfectedColor,
                          title: 'Infected',
                        ),
                        Counter(
                          number: 87,
                          color: kDeathColor,
                          title: 'Death',
                        ),
                        Counter(
                          number: 46,
                          color: kRecovercolor,
                          title: 'Recovered',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Spread of Virus',
                        style: kTitleTextstyle,
                      ),
                      Text(
                        'See details',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/map.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
