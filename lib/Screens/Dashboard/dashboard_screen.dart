import 'package:desktop_app/Screens/Bot_setup/dashe.dart';
import 'package:desktop_app/Screens/Bot_setup/linear.dart';
import 'package:desktop_app/Screens/Bot_setup/whatbot.dart';
import 'package:desktop_app/Screens/release%20groups/release_groups.dart';
import 'package:desktop_app/components/bots.dart';
import 'package:desktop_app/components/constants.dart';
import 'package:desktop_app/components/products.dart';
import 'package:desktop_app/components/profile.dart';
import 'package:desktop_app/components/status.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/header.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: bgColor),
        child: SafeArea(
          child: Row(
            children: [
              StatusPanel(),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width - 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 15),
                      child: Header(title: 'Dashboard'),
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height - 82,
                      width: MediaQuery.of(context).size.width - 350,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 3),
                            child: Main_Dash(),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 3),
                            child: Container(
                              width: 350,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 100,
                                        child: Row(
                                          children: [
                                            Text(
                                              DateTime.now().month.toString() +
                                                  '-' +
                                                  DateTime.now()
                                                      .day
                                                      .toString() +
                                                  '-' +
                                                  DateTime.now()
                                                      .year
                                                      .toString(),
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
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
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width:
                                        MediaQuery.of(context).size.width / 4.3,
                                    height: MediaQuery.of(context).size.height -
                                        200,
                                    decoration: BoxDecoration(
                                      color: bg3Color,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          width: 1, color: secondaryColor),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          blurRadius: 4.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(2.0,
                                              2.0), // shadow direction: bottom right
                                        ),
                                      ],
                                    ),
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: products.length,
                                      itemBuilder: (context, index) =>
                                          ReleaseCard2(
                                        product: products[index],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
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

class Main_Dash extends StatefulWidget {
  @override
  _Main_DashState createState() => _Main_DashState();
}

class _Main_DashState extends State<Main_Dash> {
  int serverIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.95,
      height: MediaQuery.of(context).size.height / 1.13,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.95,
              height: MediaQuery.of(context).size.height / 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoCard(
                    mainText: '\$120.00',
                    title: "Total AWS Charges\n for Today",
                    icon: Icon(
                      Icons.assessment_outlined,
                      color: primaryColor,
                      size: 42,
                    ),
                  ),
                  InfoCard(
                    mainText: '15',
                    title: "Total Active Servers",
                    icon: Icon(
                      Icons.dns_rounded,
                      color: sideColor,
                      size: 42,
                    ),
                  ),
                  InfoCard(
                    mainText: '38 est.',
                    title: "Total Successfull\nCheckouts",
                    icon: Icon(
                      Icons.shopping_bag_rounded,
                      color: side2Color,
                      size: 42,
                    ),
                  ),
                  QuickADD(),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width / 1.95,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Active Setup Groups',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.95,
                    height: MediaQuery.of(context).size.height / 3.4,
                    decoration: BoxDecoration(
                      color: bg3Color,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1.5, color: secondaryColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4.95,
                            height: MediaQuery.of(context).size.height / 3.4,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 5,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    serverIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Text(
                                          'Server Group ${index + 1}',
                                          style: GoogleFonts.inter(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 16,
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.95,
                            height: MediaQuery.of(context).size.height / 3.4,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 180,
                                        child: Text(
                                          'Setup Group: ',
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Example...',
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
                                          'Release Group: ',
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Example...',
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
                                          'AWS Server Type:',
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "XGYU23GX1XFTX",
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
                                          'Bot(s):',
                                          style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Example...',
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
                                                width: 1.5,
                                                color: Colors.white12),
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage:
                                                AssetImage(botsList[1].image),
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
                                                width: 1.5,
                                                color: Colors.white12),
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: botsList[1].color,
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              width: 1, color: Colors.white12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'See Page',
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              width: 1, color: Colors.white12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Stop',
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
                ],
              ),
            ),
            SizedBox(height: 14),
            Container(
              width: MediaQuery.of(context).size.width / 1.95,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Text(
                      'Previous Launches and AWS History...',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              border:
                                  Border.all(width: 1.5, color: secondaryColor),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 4.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0,
                                      2.0), // shadow direction: bottom right
                                ),
                              ],
                            ),
                          ),
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

class InfoCard extends StatelessWidget {
  final Icon icon;
  final String title, mainText;
  const InfoCard({
    Key key,
    this.icon,
    this.title,
    this.mainText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.height / 4.3,
          decoration: BoxDecoration(
            color: bg3Color,
            borderRadius: BorderRadius.all(Radius.circular(13)),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon,
                Text(
                  title,
                  style: GoogleFonts.inter(
                      color: Colors.white54,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  mainText,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Icon(
            Icons.info_outline_rounded,
            color: Colors.white38,
            size: 18,
          ),
        ),
      ],
    );
  }
}

class QuickADD extends StatelessWidget {
  const QuickADD({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: () => showDialog(
            context: (context),
            builder: (context) => AlertDialog(
              backgroundColor: bg3Color,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Quick Actions',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                color: bg3Color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.5, color: secondaryColor),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 4.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(2.0,
                                        2.0), // shadow direction: bottom right
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_circle_outline_rounded,
                                      color: primaryColor,
                                      size: 20,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Add Release Group',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                color: bg3Color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.5, color: secondaryColor),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 4.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(2.0,
                                        2.0), // shadow direction: bottom right
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.wifi,
                                      color: sideColor,
                                      size: 20,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Add Proxies',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                color: bg3Color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.5, color: secondaryColor),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 4.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(2.0,
                                        2.0), // shadow direction: bottom right
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.smart_toy_rounded,
                                      color: side2Color,
                                      size: 20,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Add New Bot',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: bg3Color,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    width: 1.5, color: secondaryColor),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 4.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(2.0,
                                        2.0), // shadow direction: bottom right
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Stop All',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              content: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 2.5,
                color: bg3Color,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save',
                    style: GoogleFonts.inter(color: primaryColor),
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
          ),
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.height / 4.3,
            decoration: BoxDecoration(
              color: bg3Color,
              borderRadius: BorderRadius.all(Radius.circular(13)),
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
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.timeline_rounded,
                    color: Colors.white,
                    size: 42,
                  ),
                  Text(
                    'Add Release Groups, Proxies or Stop All',
                    style: GoogleFonts.inter(
                        color: Colors.white54,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Quick Actions",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Icon(
            Icons.info_outline_rounded,
            color: Colors.white38,
            size: 18,
          ),
        ),
      ],
    );
  }
}

class ReleaseCard2 extends StatelessWidget {
  final product;
  const ReleaseCard2({key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 120,
      width: 350,
      decoration: BoxDecoration(
        color: bg3Color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1.5, color: Colors.white),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border:
                  Border.all(width: 2, color: Colors.white.withOpacity(0.7)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(product.image),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          product.title,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          product.description,
                          style: GoogleFonts.inter(
                              color: Colors.white70,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          height: 20,
                          width: 50,
                          decoration: BoxDecoration(
                            color: side2Color.withOpacity(0.7),
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '\$' + product.price.toString(),
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                  height: 30,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: side2Color.withOpacity(0.7),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReleaseGroups()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Release Group(s)",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white70,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
