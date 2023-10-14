import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/core/utils/colors.dart';
import 'package:weather/core/utils/platform.dart';
import 'package:weather/features/weather/presentation/screens/home.dart';

class GetStated extends StatelessWidget {
  const GetStated({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: gradientPurple,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: screen_size(context).height * 0.15,
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                // center: Alignment(0.5, 0.5),
                radius: 0.5,
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 255, 255, 0.0001),
                ],
                stops: [0.0, 1.0],
              ),
            ),
            child: Image.asset('assets/images/cloud_and_sun.jpg'),
          ),
        ),
        Text(
          "Weather",
          style: TextStyle(
            fontSize: 40,
            color: yellow,
          ),
        ),
        const Text(
          "Forecast App.",
          style: TextStyle(fontSize: 38, color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'It\'s the newest weather app. It has a bunch of features and that includes most of the ones that every weather app has.',
          style: TextStyle(fontSize: 12, color: Colors.white),
          maxLines: null,
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
            child: TextButton(
          onPressed: () {

           Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
          },
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(yellow)),
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              )),
        ))
      ]),
    );
  }
}
