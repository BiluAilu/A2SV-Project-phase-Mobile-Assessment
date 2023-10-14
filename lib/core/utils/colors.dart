import 'package:flutter/material.dart';

final yellow= Color.fromRGBO(255, 186, 37, 1.0);
final main_background=Color.fromRGBO(245, 244, 255, 1);
final texts_color=Color.fromRGBO(33, 23, 114, 1.0);
final texts_color2=Color.fromRGBO(159, 147, 255, 1.0);
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

const decoration1=BorderRadius.only(
      topLeft: Radius.circular(48.0),
      topRight: Radius.circular(48.0),
      bottomLeft: Radius.circular(0.0),
      bottomRight: Radius.circular(0.0),
    );