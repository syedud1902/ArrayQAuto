import 'package:desktop_app/components/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class Header extends StatelessWidget {
  final title;
  Header({
    key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Container(
            child: Row(
              children: [
                SearchField(),
                SizedBox(width: 10),
                ProfileCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: ExpansionTile(
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                profiles[0].image,
              ),
              radius: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                profiles[0].name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        children: [Container()],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search App',
          hintStyle: GoogleFonts.inter(color: Colors.white12),
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          suffixIcon: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(defaultPadding * 0.6),
              margin: EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 3),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Icon(
                Icons.search_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
