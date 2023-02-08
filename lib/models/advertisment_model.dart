import 'package:flutter/material.dart';
import 'package:music_player/constants.dart';

class Advertisment {
  final String title;
  final String description;
  final String url;
  final Color color;

  Advertisment({
    required this.description,
    required this.title,
    required this.url,
    required this.color,
  });

  static List<Advertisment> advertisments = [
    Advertisment(
      title: 'FLY THE \nFalcon',
      url: 'assets/images/Card_image.png',
      description: 'Discover 87 songs!',
      color: Colors.white,
    ),
    Advertisment(
      title: 'UNLIMITED \n POWER',
      url: 'assets/images/Card_image.png',
      description: 'Try Out 54 songs!',
      color: kAccentColor,
    ),
  ];
}
