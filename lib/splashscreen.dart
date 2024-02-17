// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types, sort_child_properties_last

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";
import "package:oneview/ApiCalling/PostWithApi.dart";
import "package:oneview/introPage.dart";

class splashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => introPage(),
          transitionDuration: Duration(seconds: 2),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
      connectToInstagram();
    getInstagramPosts();   
    },
    
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SvgPicture.asset("assets/images/1.svg"),
          Text("SocialSync",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35)),
          Text("SEAMLESS CONTENT SHARING",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 12))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
