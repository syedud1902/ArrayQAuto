import 'package:desktop_app/Screens/release%20groups/release_groups.dart';
import 'package:desktop_app/components/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class StatusPanel extends StatelessWidget {
  const StatusPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ReleaseGroup> items = List.from(releasegroupsList);
    final listKey = GlobalKey<AnimatedListState>();
    return Container(
      height: MediaQuery.of(context).size.height,
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
            width: 250,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Status Log',
                          style: GoogleFonts.inter(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: secondaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.add,
                              color: sideColor,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(
                        text: TextSpan(
                          text: ' 0 ',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: sideColor,
                          ),
                          children: [
                            TextSpan(
                              text: 'Active Bots',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RichText(
                        text: TextSpan(
                            text: ' 0 ',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: sideColor,
                            ),
                            children: [
                              TextSpan(
                                text: 'Active Servers',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white30,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 2.5,
                    width: 180,
                    color: Colors.white24,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 250,
            height: MediaQuery.of(context).size.height / 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 2.5,
                    width: 180,
                    color: Colors.white24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 240,
                    height: MediaQuery.of(context).size.height / 3 - 20,
                    child: AnimatedList(
                      key: listKey,
                      initialItemCount: items.length,
                      itemBuilder: (context, index, animation) =>
                          ReleaseGroupCard(
                        item: items[index].title,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReleaseGroupCard extends StatelessWidget {
  final item;
  const ReleaseGroupCard({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ReleaseGroups()));
        Duration(milliseconds: 600);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2),
        height: 50,
        width: 240,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2, color: secondaryColor),
            top: BorderSide(width: 2, color: secondaryColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(flex: 1),
            Container(
              width: 50,
              child: Center(
                child: Icon(
                  Icons.folder_open_rounded,
                  color: sideColor,
                  size: 20,
                ),
              ),
            ),
            Spacer(flex: 1),
            Container(
              width: 160,
              child: Text(
                item,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(flex: 1),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 14,
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
