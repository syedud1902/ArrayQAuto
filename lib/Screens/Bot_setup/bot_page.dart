import 'package:desktop_app/Screens/Bot_setup/dashe.dart';
import 'package:desktop_app/Screens/Bot_setup/linear.dart';
import 'package:desktop_app/Screens/Bot_setup/whatbot.dart';
import 'package:desktop_app/Screens/release%20groups/release_groups.dart';
import 'package:desktop_app/components/bots.dart';
import 'package:desktop_app/components/constants.dart';
import 'package:desktop_app/components/products.dart';
import 'package:desktop_app/components/profile.dart';
import 'package:desktop_app/components/status.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/header.dart';

class BotPage extends StatelessWidget {
  const BotPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: bgColor,
          child: Row(
            children: [
              StatusPanel(),
              Container(
                height: size.height,
                width: size.width - 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Header(title: 'Bot Templates'),
                    ),
                    SizedBox(height: 35),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: size.height / 1.5,
                        width: size.width - 350,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          ),
                          itemCount: botsList.length,
                          itemBuilder: (context, index) =>
                              BotCard(bot: botsList[index], pageIndex: index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BotCard extends StatelessWidget {
  final pageIndex;
  final Bots bot;
  List<Widget> botpagelist = <Widget>[
    WhatBotSetUpScreen(),
    DasheSetUpScreen(),
    LinearPage()
  ];

  BotCard({Key key, this.bot, this.pageIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pageIndex >= 3
            ? showDialog(
                context: (context),
                builder: (context) => AlertDialog(
                  backgroundColor: secondaryColor,
                  title: Text(
                    'Not Available',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  content: Text(
                    'Support for this Bot is not currently available.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'OK',
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.inter(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => botpagelist[pageIndex]),
              );

        Duration(milliseconds: 600);
      },
      child: Container(
        decoration: BoxDecoration(
          color: bg3Color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1.5, color: secondaryColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(bot.image), fit: BoxFit.fill),
                  border: Border.all(color: bot.color, width: 2)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Text(
                bot.title,
                style: GoogleFonts.roboto(
                  color: bot.color,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
