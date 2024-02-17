// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, sort_child_properties_last, avoid_unnecessary_containers, unused_import

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:oneview/pages/homePage.dart";
import "package:page_transition/page_transition.dart";

import "pages/platformList.dart";

class introPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _introPageState();
}

class _introPageState extends State<introPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        SvgPicture.asset("assets/images/2.svg"),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text(
              "Welcome to SocialSync, your all-in-one solution for managing and sharing content across social media platforms. Simplify your social media experience. Get started now",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 24)),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: ElevatedButton(
              child: Text("Get Started",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: homePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(246, 159, 29, 1)),
            ),
          ),
        )
      ]),
    );
  }
}
