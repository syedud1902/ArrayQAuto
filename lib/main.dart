import 'dart:async';
import 'dart:ui';

import 'package:desktop_app/Screens/Bot_setup/bot_page.dart';
import 'package:desktop_app/Screens/QuickTask/quicktask_setup.dart';
import 'package:desktop_app/Screens/Scheduler/Scheduler.dart';
import 'package:desktop_app/Screens/Settings/settings.dart';
import 'package:desktop_app/components/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/constants.dart';
import 'Screens/Dashboard/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desktop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: bg3Color,
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width / 3.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width / 8.5,
                      child: Image.asset(
                        'assests/images/logo1.png',
                        height: 70,
                        width: 70,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username:',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: MediaQuery.of(context).size.width / 5.5,
                          height: 50,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: TextFormField(
                              controller: _usernameController,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password:',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1, color: Colors.white12),
                          ),
                          width: MediaQuery.of(context).size.width / 5.5,
                          height: 50,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: TextFormField(
                              controller: _pwController,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
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
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  InkWell(
                    onTap: () {
                      if (_usernameController.text == profiles[0].username &&
                          _pwController.text == profiles[0].password) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SplashScreen()),
                        );
                        Duration(milliseconds: 600);
                      } else {
                        showDialog(
                          context: (context),
                          builder: (context) => AlertDialog(
                            backgroundColor: secondaryColor,
                            title: Text(
                              'Access Denied',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            content: Text(
                              'Username or Password Incorrect.',
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
                                  'Okay',
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
                        );
                      }
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 8.4,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 1, color: Colors.white12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 8.4,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(width: 1, color: Colors.white12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainBody(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: bg3Color,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 9,
                    child: Image.asset('assests/images/logo1.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: CircularProgressIndicator(
                    color: primaryColor,
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

class MainBody extends StatefulWidget {
  const MainBody({
    Key key,
  }) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  int pageIndex = 0;
  List<Widget> pagelist = <Widget>[
    Dashboard(),
    BotPage(),
    Scheduler(),
    QuickTaskScreen(),
    SettingsScreen(),
  ];

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
                height: size.height,
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
                                  image: 'assests/images/dashboard.png',
                                  press: () {
                                    setState(() {
                                      pageIndex = 0;
                                    });
                                  },
                                  selectedIndex: 0,
                                  pageIndex: pageIndex,
                                ),
                                SizedBox(height: 25),
                                IconTile(
                                  image: 'assests/images/bots_pic.png',
                                  press: () {
                                    setState(() {
                                      pageIndex = 1;
                                    });
                                  },
                                  selectedIndex: 1,
                                  pageIndex: pageIndex,
                                ),
                                SizedBox(height: 25),
                                IconTile(
                                  image: 'assests/images/calendar.png',
                                  press: () {
                                    setState(() {
                                      pageIndex = 2;
                                    });
                                  },
                                  selectedIndex: 2,
                                  pageIndex: pageIndex,
                                ),
                                SizedBox(height: 25),
                                IconTile(
                                  image: 'assests/images/quicktask.png',
                                  press: () {
                                    setState(() {
                                      pageIndex = 3;
                                    });
                                  },
                                  selectedIndex: 3,
                                  pageIndex: pageIndex,
                                ),
                                SizedBox(height: 25),
                                IconTile(
                                  image: 'assests/images/settings.png',
                                  press: () {
                                    setState(() {
                                      pageIndex = 4;
                                    });
                                  },
                                  selectedIndex: 4,
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
              Expanded(
                child: pagelist[pageIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SideBottom extends StatelessWidget {
  const SideBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(width: 1, color: Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Icon(
                    Icons.circle,
                    color: Color(0xFF5af184),
                    size: 9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: RichText(
                    text: TextSpan(
                      text: 'V0.0.1 ',
                      style: GoogleFonts.inter(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: 'BETA',
                          style: GoogleFonts.inter(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
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
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final pageIndex;

  const DrawerListTile(
      {key, this.title, this.image, this.press, this.pageIndex})
      : super(key: key);

  final String title, image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: ListTile(
        hoverColor: secondaryColor,
        onTap: () {
          press();
        },
        horizontalTitleGap: 0.0,
        leading: Image.asset(image, height: 20, width: 20, color: Colors.white),
        title: Text(
          title,
          style: GoogleFonts.inter(
            color: Colors.white54,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final selectedIndex;
  final pageIndex;

  const IconTile(
      {key, this.image, this.press, this.pageIndex, this.selectedIndex})
      : super(key: key);

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: pageIndex == selectedIndex
                  ? Colors.grey.withOpacity(0.4)
                  : Colors.transparent),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
            shape: CircleBorder(),
          ),
          onPressed: () {
            press();
          },
          child: Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(image,
                  height: 26, width: 26, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
