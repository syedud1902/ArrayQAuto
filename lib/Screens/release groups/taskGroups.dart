import 'package:desktop_app/Screens/release%20groups/release_groups.dart';
import 'package:desktop_app/components/bots.dart';
import 'package:desktop_app/components/constants.dart';
import 'package:desktop_app/components/header.dart';
import 'package:desktop_app/components/status.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

class Taskgroup {
  final String title;

  Taskgroup(this.title);
}

final List<Taskgroup> taskGroupsList = [Taskgroup('Deafult Task Group')];

class ServerTemplate {
  final String title;

  ServerTemplate(this.title);
}

final List<ServerTemplate> serverCardList = [];

class TaskGroupPage1 extends StatefulWidget {
  final title;
  const TaskGroupPage1({Key key, this.title}) : super(key: key);

  @override
  _TaskGroupPage1State createState() => _TaskGroupPage1State();
}

class _TaskGroupPage1State extends State<TaskGroupPage1> {
  final listKey = GlobalKey<AnimatedListState>();
  TextEditingController _taskGroupController = TextEditingController();

  void insertItem(String title) {
    final newIndex = 0;
    final newItem = Taskgroup(title);
    taskGroupsList.insert(newIndex, newItem);
    listKey.currentState.insertItem(
      newIndex,
      duration: Duration(milliseconds: 600),
    );
  }

  void removeItem(int index) {
    final removedItem = taskGroupsList[index];

    taskGroupsList.removeAt(index);
    listKey.currentState.removeItem(
      index,
      (context, animation) => TaskGroupWidget(
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
      body: SafeArea(
        child: Container(
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
                                        builder: (context) => ReleaseGroups(),
                                      ),
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
              StatusPanel(),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: size.height,
                    width: size.width - 350,
                    color: bgColor,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Header(
                            title: widget.title,
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: size.height - 100,
                            width: size.width - 350,
                            child: Row(
                              children: [
                                Container(
                                  height: size.height - 100,
                                  width: size.width / 3.5,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: AnimatedList(
                                      key: listKey,
                                      initialItemCount: taskGroupsList.length,
                                      itemBuilder:
                                          (context, index, animation) =>
                                              TaskGroupWidget(
                                        index: index,
                                        item: taskGroupsList[index],
                                        animation: animation,
                                        onClicked: () => removeItem(index),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 30,
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
                              'Add New Task Group',
                              style: GoogleFonts.inter(color: Colors.white),
                            ),
                            content: Container(
                              height: 70,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _taskGroupController,
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                    decoration: new InputDecoration(
                                        hintText: 'Enter Task Group Title'),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  insertItem(
                                      _taskGroupController.text.toString());
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
                        color: Colors.white,
                        icon: Icon(Icons.add),
                        iconSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskGroupWidget extends StatefulWidget {
  final index;
  final Taskgroup item;
  final Animation<double> animation;
  final VoidCallback onClicked;
  const TaskGroupWidget({
    Key key,
    this.item,
    this.animation,
    this.onClicked,
    this.index,
  }) : super(key: key);

  @override
  _TaskGroupWidgetState createState() => _TaskGroupWidgetState();
}

class _TaskGroupWidgetState extends State<TaskGroupWidget> {
  final listKey2 = GlobalKey<AnimatedListState>();

  String valueChoosen;
  String hint = 'Choose Bot';

  void insertItem2(String title) {
    final newIndex = 0;
    final newItem = ServerTemplate(title);
    serverCardList.insert(newIndex, newItem);
    listKey2.currentState.insertItem(
      newIndex,
      duration: Duration(milliseconds: 600),
    );
  }

  void removeItem2(int index) {
    final removedItem = serverCardList[index];

    serverCardList.removeAt(index);
    listKey2.currentState.removeItem(
      index,
      (context, animation) => ServerCard(
        item: removedItem,
        animation: animation,
        onClicked2: () {},
      ),
      duration: Duration(milliseconds: 500),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => showDialog(
          context: (context),
          builder: (context) => AlertDialog(
            backgroundColor: bg3Color,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      '${widget.item.title}',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.5,
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
                          backgroundColor: Colors.transparent,
                          title: Row(
                            children: [
                              Container(
                                width: size.width / 13,
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
                                      color: primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width / 6,
                                child: Text(
                                  'Attached Server Type',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width / 6,
                                child: Text(
                                  'Attached Server Size',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width / 6,
                                child: Text(
                                  'AWS Account #1',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Spacer(),
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
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: AnimatedList(
                        key: listKey2,
                        initialItemCount: serverCardList.length,
                        itemBuilder: (context, index, animation) => ServerCard(
                          item: serverCardList[index],
                          animation: animation,
                          onClicked2: () => removeItem2(index),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => showDialog(
                      context: (context),
                      builder: (context) => AlertDialog(
                        backgroundColor: secondaryColor,
                        title: Text(
                          'Add Bot to Task Group',
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        content: Container(
                          child: DropdownButton(
                            dropdownColor: bg3Color,
                            hint: Text('$hint'),
                            value: valueChoosen,
                            onChanged: (value) {
                              setState(() {
                                valueChoosen = value;
                                hint = value;
                              });
                            },
                            items: botsList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem.title,
                                child: Text('${valueItem.title}'),
                              );
                            }).toList(),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              insertItem2(valueChoosen);
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
                      width: size.width / 1.5,
                      decoration: BoxDecoration(
                        color: bg3Color,
                        border: Border.all(width: 2.5, color: secondaryColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(9),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add New Bot',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.add_circle_outline_rounded,
                            color: primaryColor,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: GoogleFonts.inter(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: secondaryColor),
              borderRadius: BorderRadius.circular(10),
              color: bg3Color),
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: secondaryColor),
                    child: Center(
                      child: Text(
                        '${widget.index.toString()}',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.item.title}',
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '${serverCardList.length} ',
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
                    RichText(
                      text: TextSpan(
                        text: '${serverCardList.length} ',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: 'Bots Attached',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
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
                        Icons.delete_forever,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServerCard extends StatelessWidget {
  final ServerTemplate item;
  final Animation<double> animation;
  final VoidCallback onClicked2;
  ServerCard({key, this.item, this.animation, this.onClicked2});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width / 1.5,
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
                      backgroundColor: Colors.transparent,
                      title: Row(
                        children: [
                          Container(
                            width: size.width / 13,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      '${botsList[botsList.indexWhere((element) => element.title == item.title)].image}'),
                                )),
                          ),
                          Container(
                            width: size.width / 6,
                            child: Text(
                              '${item.title} # ${serverCardList.indexOf(item)}',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width / 6,
                            child: Text(
                              'Template Not Assigned',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width / 6,
                            child: Text(
                              '${botsList[botsList.indexWhere((element) => element.title == item.title)].path}',
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
                                      onPressed: onClicked2,
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
                                width: size.width / 1.7,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                width: size.width / 1.5,
                                height: 350,
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
