import 'package:desktop_app/components/constants.dart';
import 'package:flutter/material.dart';

class Bots {
  final String image, title, license, path;
  final Color color;
  Bots({
    this.license,
    this.path,
    this.image,
    this.title,
    this.color,
  });
}

List<Bots> botsList = [
  Bots(
    title: 'What Bot',
    image: 'assests/images/WhatBot.jpg',
    color: Color(0xFF2986ed),
    license: 'XXXX-XXXX-XXX',
    path: 'C:/XXX/XXX/XXX/XXX',
  ),
  Bots(
    title: 'Dashe',
    image: 'assests/images/Dashe.png',
    color: Color(0xFF4b78c2),
    license: 'XXXX-XXXX-XXX',
    path: 'C:/XXX/XXX/XXX/XXX',
  ),
  Bots(
    title: 'LinearAIO',
    image: 'assests/images/linear.jpg',
    color: primaryColor,
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'Balkobot',
    image: 'assests/images/Balko.png',
    color: Colors.white54,
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'MekAIO',
    image: 'assests/images/MekAIO.png',
    color: Color(0xFFb84343),
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'Cybersole',
    image: 'assests/images/cybersole.png',
    color: Color(0xFF5af184),
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'GaneshBot',
    image: 'assests/images/Ganesh.png',
    color: Color(0xFFc44629),
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'Tohru',
    image: 'assests/images/tohru.jpg',
    color: Color(0xFFE8555F),
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'SplashForce 4.0',
    image: 'assests/images/splashforce.png',
    color: Colors.white70,
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'WrathAIO',
    image: 'assests/images/wrath.png',
    color: Color(0xFF1C8ABF),
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'FlareAIO',
    image: 'assests/images/flare.png',
    color: Color(0xFF8B0101),
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'Nyte',
    image: 'assests/images/Nyte.jpg',
    color: Color(0xFF759EFE),
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'ValorAIO',
    image: 'assests/images/valor.jpg',
    color: Color(0xFF5B87FF),
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'PrismAIO',
    image: 'assests/images/prism.png',
    color: Color(0xFF8D5ADA),
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
  Bots(
    title: 'KylinBot',
    image: 'assests/images/Kylin.png',
    color: Colors.white70,
    path: 'C:/XXX/XXX/XXX/XXX',
    license: 'XXXX-XXXX-XXX',
  ),
];
