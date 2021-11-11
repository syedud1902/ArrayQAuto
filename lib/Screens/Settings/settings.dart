import 'dart:html';
import 'dart:ui';
import 'package:desktop_app/components/bots.dart';
import 'package:desktop_app/components/constants.dart';
import 'package:desktop_app/components/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int pageIndex = 0;
  List<Widget> pagelist = <Widget>[
    Profile(),
    KeyPage(),
    AWSPage(),
    BotManagePage(),
    DashSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width - 100,
        color: bgColor,
        child: Row(
          children: [
            Container(
              height: size.height,
              width: 250,
              decoration: BoxDecoration(
                color: bgColor,
                border: Border(
                  right: BorderSide(color: secondaryColor, width: 2),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: secondaryColor, width: 2),
                        bottom: BorderSide(color: secondaryColor, width: 2),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Settings',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: secondaryColor, width: 2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.manage_accounts,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Profile',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.manage_accounts,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Manage Username, Password, ...',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: secondaryColor, width: 2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.fingerprint,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Key Management',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.manage_accounts,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Manage Devices, Keys, ...',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: secondaryColor, width: 2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.dns_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'AWS Management',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.manage_accounts,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Manage AWS Account, Servers, ...',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageIndex = 3;
                      });
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: secondaryColor, width: 2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.toll_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Bot Management',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.manage_accounts,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Manage Bots, Add & Delete, ...',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pageIndex = 4;
                      });
                    },
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: secondaryColor, width: 2),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.dashboard,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Dashboard Settings',
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.manage_accounts,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Change Theme, Notifications, ...',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: size.height,
                  width: size.width - 350,
                  child: Center(child: pagelist[pageIndex]),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Text(
                              'Save Changes',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Text(
                              'Reset/Cancel',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: 750,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Text(
                'Account',
                style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Change Display Name, Change Email and Manage Password',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: 340,
                          height: 50,
                          child: TextFormField(
                            onFieldSubmitted: (value) {},
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: 340,
                          height: 50,
                          child: TextFormField(
                            onFieldSubmitted: (value) {},
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: 480,
                          height: 50,
                          child: TextFormField(
                            onFieldSubmitted: (value) {},
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: 'firstnamelastname@gmail.com'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.done,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            onFieldSubmitted: (value) {},
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: 'M_I**************123'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Text(
                              'Change Password',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Text(
                              'Reset',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: side2Color,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1.5, color: Colors.white12),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(profiles[0].image),
                      radius: 20,
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                      color: bg3Color,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1, color: Colors.white12),
                    ),
                    child: Center(
                      child: Text(
                        'Save Change',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: bg3Color,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1, color: Colors.white12),
                    ),
                    child: Center(
                      child: Text(
                        'Reset',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: sideColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WebHook',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: 480,
                          height: 50,
                          child: TextFormField(
                            onFieldSubmitted: (value) {},
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: profiles[0].webhook),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.done,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            ),
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
    );
  }
}

class KeyPage extends StatelessWidget {
  const KeyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: 750,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Text(
                'License Details',
                style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Devices & Key(s)',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Monitor Actice Devices and Keys, Key Limit TBD',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Key',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: 380,
                          height: 50,
                          child: Center(
                            child: Text(
                              'XXXX-XXXX-XXXX-XXXX',
                              style: GoogleFonts.inter(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: side2Color,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.restart_alt_outlined,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.highlight_off_rounded,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Desktop & Chrome',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(flex: 2),
                      Text(
                        'Mobile',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: bg3Color,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1, color: Colors.white12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Container(
                              height: 290,
                              width: 480,
                              child: ListView.builder(
                                itemCount: 6,
                                itemBuilder: (context, index) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    height: 50,
                                    width: 360,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.white12),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$index',
                                              style: GoogleFonts.inter(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          height: 50,
                                          width: 290,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Test Device',
                                                    style: GoogleFonts.inter(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Container(
                                                    height: 8,
                                                    width: 8,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.green,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                'Active: Last Used 7-28-21 10AM',
                                                style: GoogleFonts.inter(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(flex: 3),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete),
                                          color: sideColor,
                                        ),
                                        Spacer(flex: 2),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 290,
                              width: 200,
                              child: Center(
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        width: 1, color: Colors.white12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'No Devices',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AWSPage extends StatelessWidget {
  const AWSPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: 750,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'AWS Management',
                style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AWS Account',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Add or Delete AWS Account(s), up to 3 accounts',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Current Account',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: bg3Color,
                    border: Border.all(width: 2.5, color: secondaryColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 130,
                              child: Text(
                                'AWS Access Key: ',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              'XXX-XXX-XXX',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 130,
                              child: Text(
                                'AWS Secret Key: ',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              'XXX-XXX-XXX',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 130,
                              child: Text(
                                'AWS Region:',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              'US-EAST-1',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AWS Access Key',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: 340,
                          height: 50,
                          child: TextFormField(
                            onFieldSubmitted: (value) {},
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AWS Region',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: 340,
                          height: 50,
                          child: TextFormField(
                            onFieldSubmitted: (value) {},
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AWS Secret Key',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: 480,
                          height: 50,
                          child: TextFormField(
                            onFieldSubmitted: (value) {},
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: 'XXXX-XXXX-XXXX-XXXX'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.done,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: bg3Color,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            ),
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
    );
  }
}

class BotManagePage extends StatefulWidget {
  BotManagePage({Key key}) : super(key: key);

  @override
  _BotManagePageState createState() => _BotManagePageState();
}

class _BotManagePageState extends State<BotManagePage> {
  int botIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: 750,
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Bot Management',
                style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Bot(s)',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Add or Delete Bot Account(s), unlimited Bots can be added',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  color: bg3Color,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(width: 1, color: Colors.white12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 250,
                        width: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: botsList.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              setState(() {
                                botIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage(botsList[index].image),
                                    ),
                                    SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Bot $index: ${botsList[index].title}',
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'XXX-XXX-XXX-XXX',
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 210,
                        width: 2.5,
                        color: primaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 10.0),
                        child: Container(
                          height: 210,
                          width: 450,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 180,
                                    child: Text(
                                      'Bot: ',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    botsList[botIndex].title,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 180,
                                    child: Text(
                                      'Bot License: ',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    botsList[botIndex].license,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 180,
                                    child: Text(
                                      'Bot Path:',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    botsList[botIndex].path,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 180,
                                    child: Text(
                                      'Bot Download Link:',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'XXXXXXXXX.com',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 180,
                                    child: Text(
                                      'Bot NickName:',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    botsList[botIndex].title +
                                        ' (Bot #: $botIndex)',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1.5, color: Colors.white12),
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                            botsList[botIndex].image),
                                        radius: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1.5, color: Colors.white12),
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            botsList[botIndex].color,
                                        radius: 20,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      color: bg3Color,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          width: 1, color: Colors.white12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Save Change',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: bg3Color,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          width: 1, color: Colors.white12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Reset',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: side2Color,
                                        ),
                                      ),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Bot',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: bg3Color,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1, color: Colors.white12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Enter Bot Name',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: bgColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            width: 1, color: Colors.white12),
                                      ),
                                      width: 230,
                                      height: 40,
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: TextFormField(
                                          onFieldSubmitted: (value) {},
                                          textAlign: TextAlign.center,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Enter Bot Path',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: bgColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            width: 1, color: Colors.white12),
                                      ),
                                      width: 230,
                                      height: 40,
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: TextFormField(
                                          onFieldSubmitted: (value) {},
                                          textAlign: TextAlign.center,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Enter Bot NickName',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: bgColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            width: 1, color: Colors.white12),
                                      ),
                                      width: 200,
                                      height: 40,
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: TextFormField(
                                          onFieldSubmitted: (value) {},
                                          textAlign: TextAlign.center,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Enter Bot License',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: bgColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        border: Border.all(
                                            width: 1, color: Colors.white12),
                                      ),
                                      width: 280,
                                      height: 40,
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: TextFormField(
                                          onFieldSubmitted: (value) {},
                                          textAlign: TextAlign.center,
                                          decoration: new InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Enter Download Link',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: bgColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.white12),
                                          ),
                                          width: 230,
                                          height: 40,
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: TextFormField(
                                              onFieldSubmitted: (value) {},
                                              textAlign: TextAlign.center,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          height: 40,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: bg3Color,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.white12),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.done,
                                              color: side2Color,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          height: 40,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: bg3Color,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                width: 1,
                                                color: Colors.white12),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashSettingsPage extends StatelessWidget {
  const DashSettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: 750,
      color: bgColor,
    );
  }
}
