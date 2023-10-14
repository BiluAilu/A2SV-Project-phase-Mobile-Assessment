import 'package:flutter/material.dart';

final yellow= Color.fromRGBO(255, 186, 37, 1.0);
final mian_background=Color.fromRGBO(245, 244, 255, 1);

const gradientPurple= BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFF3C2DB9), // #3C2DB9 in hex
                Color(0xFF211772), // #211772 in hex
              ],
              stops: [0.0109, 1.0129], // Corresponding stops for the colors
            ),
          );