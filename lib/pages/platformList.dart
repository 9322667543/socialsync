import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";

import 'platformAuthentication.dart';

class PlatformList extends StatelessWidget {
  const PlatformList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Social Platforms",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              const Text(
                "Please authorize to use our posting feature.",
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(48, 46, 49, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      "assets/images/insta.svg",
                    ),
                    title: const Text(
                      "Instagram",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: const Text(
                      "Verified",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => PlatfrmAuthentication(
                          logo: SvgPicture.asset(
                            "assets/images/insta.svg",
                          ),
                          name: "Instagram"),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(48, 46, 49, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      "assets/images/fb.svg",
                    ),
                    title: const Text(
                      "Facebook",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: const Text(
                      "Verified",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => PlatfrmAuthentication(
                          logo: SvgPicture.asset(
                            "assets/images/fb.svg",
                          ),
                          name: "Facebook"),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              InkWell(
                child: Container(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(48, 46, 49, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      "assets/images/yt.svg",
                    ),
                    title: const Text(
                      "Youtube",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: const Text(
                      "Verified",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => PlatfrmAuthentication(
                          logo: SvgPicture.asset(
                            "assets/images/yt.svg",
                          ),
                          name: "Youtube"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
