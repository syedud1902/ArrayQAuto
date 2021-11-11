import 'dart:ui';

import 'package:desktop_app/components/constants.dart';
import 'package:desktop_app/components/header.dart';
import 'package:desktop_app/components/status.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

class QuickTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Row(
                children: [
                  StatusPanel(),
                  Container(
                    height: size.height,
                    width: size.width - 350,
                    color: bgColor,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Header(
                            title: 'Quick Tasks',
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: ' 0 ',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Active QuickTasks Monitors',
                                        style: GoogleFonts.inter(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white30,
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: size.width - 350,
                            decoration: BoxDecoration(
                              color: bgColor,
                              border: Border(
                                bottom:
                                    BorderSide(width: 2, color: secondaryColor),
                                top:
                                    BorderSide(width: 2, color: secondaryColor),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 230,
                                  child: Text(
                                    'Run Group',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 310,
                                  child: Text(
                                    'QuickTask Group Title',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 240,
                                  child: Text(
                                    'Bot Attached',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 240,
                                  child: Text(
                                    'Attached Servers',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 120,
                                  child: Text(
                                    'Delete Group',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                  iconSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 7,
                  sigmaY: 7,
                ),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      'Coming Soon',
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
