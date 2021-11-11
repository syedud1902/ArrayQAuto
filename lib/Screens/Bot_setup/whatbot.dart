import 'dart:ui';
import 'package:desktop_app/components/bots.dart';
import 'package:desktop_app/components/constants.dart';
import 'package:desktop_app/components/header.dart';
import 'package:desktop_app/components/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import '../../main.dart';

class WhatBotSetUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WBMainBody());
  }
}

class WhatBotTemplate {
  final String title;

  WhatBotTemplate(this.title);
}

final List<WhatBotTemplate> templateList = [
  WhatBotTemplate('Default Template'),
  WhatBotTemplate('Default Template'),
  WhatBotTemplate('Default Template'),
  WhatBotTemplate('Default Template'),
];

class WBMainBody extends StatefulWidget {
  WBMainBody({key}) : super(key: key);

  @override
  _WBMainBodyState createState() => _WBMainBodyState();
}

class _WBMainBodyState extends State<WBMainBody> {
  UniqueKey keyTile;
  bool isExpanded = false;
  final listKey = GlobalKey<AnimatedListState>();
  TextEditingController _whatbotController = TextEditingController();

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  void insertItem(String title) {
    final newIndex = 0;
    final newItem = WhatBotTemplate(title);
    templateList.insert(newIndex, newItem);
    listKey.currentState.insertItem(
      newIndex,
      duration: Duration(milliseconds: 600),
    );
  }

  void removeItem(int index) {
    final removedItem = templateList[index];

    templateList.removeAt(index);
    listKey.currentState.removeItem(
      index,
      (context, animation) => TemplateWidget(
        item: removedItem,
        animation: animation,
        onClicked: () {},
      ),
      duration: Duration(milliseconds: 500),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: size.height,
              child: Drawer(
                elevation: 0,
                child: SingleChildScrollView(
                  child: Container(
                    height: size.height,
                    decoration: BoxDecoration(color: secondaryColor),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                child: Center(
                                  child: Container(
                                    height: 80,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assests/images/new_logo.png',
                                        height: 70,
                                        width: 70,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 1, width: 85, color: Colors.white),
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
                              ),
                              SizedBox(height: 25),
                              IconTile(
                                image: 'assests/images/calendar.png',
                                press: () {
                                  Navigator.pop(context);
                                },
                                selectedIndex: 1,
                              ),
                              SizedBox(height: 25),
                              IconTile(
                                image: 'assests/images/quicktask.png',
                                press: () {
                                  Navigator.pop(context);
                                },
                                selectedIndex: 2,
                              ),
                              SizedBox(height: 25),
                              IconTile(
                                image: 'assests/images/settings.png',
                                press: () {
                                  Navigator.pop(context);
                                },
                                selectedIndex: 3,
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
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: size.height,
                  width: size.width - 100,
                  color: bgColor,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Header(title: 'What Bot Setup'),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 100),
                          child: Container(
                            height: size.height - 200,
                            width: size.width - 300,
                            child: Center(
                              child: AnimatedList(
                                key: listKey,
                                initialItemCount: templateList.length,
                                itemBuilder: (context, index, animation) =>
                                    TemplateWidget(
                                  item: templateList[index],
                                  animation: animation,
                                  onClicked: () => removeItem(index),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 30,
                  child: InkWell(
                    onTap: () => showDialog(
                      context: (context),
                      builder: (context) => AlertDialog(
                        backgroundColor: secondaryColor,
                        title: Text(
                          'Add New Template',
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        content: Container(
                          height: 70,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _whatbotController,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                decoration: new InputDecoration(
                                    hintText: 'Enter Template Title'),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _whatbotController.text.isEmpty
                                  ? null
                                  : insertItem(_whatbotController.text);
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
                    ),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: Center(
                          child:
                              Icon(Icons.add, color: Colors.white, size: 25)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TemplateWidget extends StatefulWidget {
  final WhatBotTemplate item;
  final Animation<double> animation;
  final VoidCallback onClicked;
  TemplateWidget({key, this.item, this.animation, this.onClicked});

  @override
  _TemplateWidgetState createState() => _TemplateWidgetState();
}

class _TemplateWidgetState extends State<TemplateWidget> {
  String filename = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizeTransition(
      sizeFactor: widget.animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width / 1.3,
                decoration: BoxDecoration(
                  color: bg3Color.withOpacity(0.7),
                  border: Border.all(width: 2.5, color: secondaryColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(9),
                  ),
                ),
                child: Center(
                  child: InkWell(
                    onTap: () {},
                    child: ExpansionTile(
                      iconColor: side2Color,
                      backgroundColor: Colors.transparent,
                      title: Row(
                        children: [
                          Container(
                            width: size.width / 10,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
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
                                          style: GoogleFonts.inter(
                                              color: primaryColor),
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
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: sideColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width / 5,
                            child: Text(
                              '${widget.item.title} # ${templateList.indexOf(widget.item)}',
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
                                  text: ' 0 ',
                                  style: GoogleFonts.inter(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: sideColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Active Servers',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          Container(
                            width: size.width / 5,
                            child: Text(
                              'Task Group File',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 25,
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
                                      onPressed: widget.onClicked,
                                      child: Text(
                                        'Delete',
                                        style: GoogleFonts.inter(
                                            color: Colors.red),
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
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 2.5,
                                width: size.width / 1.4,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                width: size.width / 1.3,
                                height: 350,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.width / 4,
                                        height: 350,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: bgColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.white12),
                                                ),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5.5,
                                                height: 50,
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: TextFormField(
                                                    style: GoogleFonts.inter(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                    onFieldSubmitted:
                                                        (value) {},
                                                    textAlign: TextAlign.center,
                                                    decoration:
                                                        new InputDecoration(
                                                      hintText: 'Template Name',
                                                      hintStyle:
                                                          GoogleFonts.inter(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                      ),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Container(
                                                height: 80,
                                                width: size.width / 5.5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 4.0),
                                                      child: Text(
                                                        'Upload Profiles (.csv)',
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      4.0),
                                                          child: IconButton(
                                                            onPressed:
                                                                () async {
                                                              final response =
                                                                  await http.get(
                                                                      Uri.parse(
                                                                          'http://127.0.0.1:5000/WhatBot_data2'));
                                                              print(response);
                                                              final decoded =
                                                                  jsonDecode(response
                                                                          .body)
                                                                      as String;
                                                              setState(() {
                                                                filename =
                                                                    decoded;
                                                              });
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .cloud_upload_rounded,
                                                              color:
                                                                  primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Text(
                                                            filename == ''
                                                                ? 'No File Added'
                                                                : filename,
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors
                                                                  .white60,
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: Container(
                                                height: 80,
                                                width: size.width / 5.5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 4.0),
                                                      child: Text(
                                                        'Upload Proxies (.csv)',
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      4.0),
                                                          child: IconButton(
                                                            onPressed:
                                                                () async {
                                                              final response =
                                                                  await http.get(
                                                                      Uri.parse(
                                                                          'http://127.0.0.1:5000/WhatBot_data2'));
                                                              print(response);
                                                              final decoded =
                                                                  jsonDecode(response
                                                                          .body)
                                                                      as String;
                                                              setState(() {
                                                                filename =
                                                                    decoded;
                                                              });
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .cloud_upload_rounded,
                                                              color:
                                                                  primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Text(
                                                            filename == ''
                                                                ? 'No File Added'
                                                                : filename,
                                                            style: GoogleFonts
                                                                .inter(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors
                                                                  .white60,
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                      ],
                                                    )
                                                  ],
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
                            ),
                          ],
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
    );
  }
}
