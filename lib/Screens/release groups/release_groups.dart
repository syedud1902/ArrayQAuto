import 'dart:js';

import 'package:desktop_app/Screens/Dashboard/dashboard_screen.dart';
import 'package:desktop_app/Screens/release%20groups/taskGroups.dart';
import 'package:desktop_app/components/bots.dart';
import 'package:desktop_app/components/constants.dart';
import 'package:desktop_app/components/header.dart';
import 'package:desktop_app/components/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

class ReleaseGroup {
  final String title;
  final bot;

  ReleaseGroup(this.title, this.bot);
}

final List<ReleaseGroup> releasegroupsList = [
  ReleaseGroup(
    'Mocha Release Group',
    botsList[0],
  ),
  ReleaseGroup(
    'UNC Release Group',
    botsList[1],
  ),
  ReleaseGroup(
    'Yeezy Release Group',
    botsList[2],
  ),
  ReleaseGroup(
    'Slides Release Group',
    botsList[3],
  ),
];

class ReleaseGroups extends StatefulWidget {
  const ReleaseGroups({Key key}) : super(key: key);

  @override
  _ReleaseGroupsState createState() => _ReleaseGroupsState();
}

class _ReleaseGroupsState extends State<ReleaseGroups> {
  int pageIndex = 0;
  final listKey = GlobalKey<AnimatedListState>();
  TextEditingController _rgController = TextEditingController();
  TextEditingController _rgControllerBot = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Row(
            children: [
              Container(
                width: 100,
                child: Drawer(
                  elevation: 0,
                  child: SingleChildScrollView(
                    child: Container(
                      height: size.height,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: Image.asset(
                                    'assests/images/logo1.png',
                                    height: 80,
                                    width: 80,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                Container(
                                    height: 1,
                                    width: size.width / 20,
                                    color: Colors.white),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                          Container(
                            height: 400,
                            width: double.infinity,
                            child: Column(
                              children: [
                                IconTile(
                                  image: 'assests/images/arrow.png',
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainBody()),
                                    );
                                    Duration(milliseconds: 600);
                                  },
                                  selectedIndex: 0,
                                  pageIndex: pageIndex,
                                ),
                                SizedBox(height: 25),
                                IconTile(
                                  image: 'assests/images/calendar.png',
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                  selectedIndex: 1,
                                  pageIndex: pageIndex,
                                ),
                                SizedBox(height: 25),
                                IconTile(
                                  image: 'assests/images/quicktask.png',
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                  selectedIndex: 2,
                                  pageIndex: pageIndex,
                                ),
                                SizedBox(height: 25),
                                IconTile(
                                  image: 'assests/images/settings.png',
                                  press: () {
                                    Navigator.pop(context);
                                  },
                                  selectedIndex: 3,
                                  pageIndex: pageIndex,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 60,
                            width: double.infinity,
                            child: SideBottom(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
                        title: 'Release Groups',
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
                                    text: 'Current Release Groups Made',
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
                            bottom: BorderSide(width: 2, color: secondaryColor),
                            top: BorderSide(width: 2, color: secondaryColor),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: size.width / 9,
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
                              width: size.width / 5,
                              child: Text(
                                'Release Group Title',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: size.width / 5,
                              child: Text(
                                'Task Groups',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: size.width / 5,
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
                              width: 60,
                              child: Text(
                                'Delete',
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
                          Container(
                            height: size.height - 200,
                            width: size.width - 350,
                            child: AnimatedList(
                              key: listKey,
                              initialItemCount: releasegroupsList.length,
                              itemBuilder: (context, index, animation) =>
                                  InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TaskGroupPage1(
                                        title: releasegroupsList[index].title,
                                      ),
                                    ),
                                  );
                                  Duration(milliseconds: 600);
                                },
                                child: RGWidget(
                                  item: releasegroupsList[index],
                                  animation: animation,
                                  onClicked: () {
                                    removeItem(index);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 20,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor,
                              ),
                              child: IconButton(
                                  onPressed: () => showDialog(
                                        context: (context),
                                        builder: (context) => AlertDialog(
                                          backgroundColor: secondaryColor,
                                          title: Text(
                                            'Add Release Group',
                                            style: GoogleFonts.inter(
                                                color: Colors.white),
                                          ),
                                          content: Container(
                                            height: 100,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _rgController,
                                                  decoration: new InputDecoration(
                                                      hintText:
                                                          'Enter Release Group Title'),
                                                ),
                                                TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: <
                                                      TextInputFormatter>[
                                                    FilteringTextInputFormatter
                                                        .digitsOnly
                                                  ],
                                                  controller: _rgControllerBot,
                                                  decoration: new InputDecoration(
                                                      hintText:
                                                          'Pick Bot for Release Group'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                insertItem(
                                                    _rgController.text,
                                                    int.parse(
                                                        _rgControllerBot.text));
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'OK',
                                                style: GoogleFonts.inter(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: GoogleFonts.inter(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  icon: Icon(Icons.add),
                                  iconSize: 25,
                                  color: Colors.white),
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
    );
  }

  void insertItem(String title, int bot) {
    final newIndex = 0;
    final newItem = ReleaseGroup(title, botsList[bot]);
    releasegroupsList.insert(newIndex, newItem);
    listKey.currentState.insertItem(
      newIndex,
      duration: Duration(milliseconds: 600),
    );
  }

  void removeItem(int index) {
    final removedItem = releasegroupsList[index];

    releasegroupsList.removeAt(index);

    listKey.currentState.removeItem(
      index,
      (context, animation) => RGWidget(
        item: removedItem,
        animation: animation,
        onClicked: () {},
      ),
      duration: Duration(milliseconds: 500),
    );
  }
}

class RGWidget extends StatelessWidget {
  final ReleaseGroup item;
  final Animation<double> animation;
  final VoidCallback onClicked;
  const RGWidget({key, this.item, this.animation, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizeTransition(
      key: ValueKey(item.bot.image),
      sizeFactor: animation,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(
            bottom: BorderSide(width: 2, color: secondaryColor),
            top: BorderSide(width: 2, color: secondaryColor),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width / 9,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => showDialog(
                          context: (context),
                          builder: (context) => AlertDialog(
                            backgroundColor: secondaryColor,
                            title: Text(
                              'Confirm Launch',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            content: Text(
                              'Are You Sure You Want to Launch?',
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
                                  'Run',
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
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.1)),
                          child: Center(
                            child: Icon(
                              Icons.play_arrow_outlined,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () => showDialog(
                          context: (context),
                          builder: (context) => AlertDialog(
                            backgroundColor: secondaryColor,
                            title: Text(
                              'Schedule Release Group',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            content: Text(
                              'Choose a Time to Schedule?',
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
                                  'Schedule',
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
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.1)),
                          child: Center(
                            child: Icon(
                              Icons.schedule_outlined,
                              color: primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width / 5,
                child: Text(
                  item.title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: size.width / 5,
                child: RichText(
                  text: TextSpan(
                    text: '0 ',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Task Groups Attached',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width / 5,
                child: RichText(
                  text: TextSpan(
                    text: '0 ',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Servers Attached',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                child: Container(
                  width: 50,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => showDialog(
                        context: (context),
                        builder: (context) => AlertDialog(
                          backgroundColor: secondaryColor,
                          title: Text(
                            'Confirm Delete',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          content: Text(
                            'Are You Sure You Want to Delete?',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white54,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: onClicked,
                              child: Text(
                                'Delete',
                                style: GoogleFonts.inter(color: Colors.red),
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
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
