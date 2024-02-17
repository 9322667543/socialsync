// ignore_for_file: prefer_const_constructors

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:oneview/introPage.dart";
import "package:oneview/pages/aiGen.dart";
import "package:oneview/pages/dashborad.dart";
import "package:oneview/pages/platformList.dart";
import "package:oneview/pages/postUpload.dart";
import "package:oneview/splashscreen.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";

Widget createBottomNavigationBar(context) {
  PersistentTabController _controller;
  _controller = PersistentTabController(initialIndex: 0);

  return PersistentTabView(
    context,
    controller: _controller,
    screens: _buildScreens(),
    items: _navBarsItems(),
    confineInSafeArea: true,
    backgroundColor: Colors.black, // Default is Colors.white.
    handleAndroidBackButtonPress: true, // Default is true.
    resizeToAvoidBottomInset:
        true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
    stateManagement: true, // Default is true.
    hideNavigationBarWhenKeyboardShows:
        true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
    decoration: NavBarDecoration(
      borderRadius: BorderRadius.circular(10.0),
      colorBehindNavBar: Colors.white,
    ),
    popAllScreensOnTapOfSelectedTab: true,
    popActionScreens: PopActionScreensType.all,
    itemAnimationProperties: ItemAnimationProperties(
      // Navigation Bar's items animation properties.
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    ),
    screenTransitionAnimation: ScreenTransitionAnimation(
      // Screen transition animation on change of selected tab.
      animateTabTransition: true,
      curve: Curves.ease,
      duration: Duration(milliseconds: 200),
    ),
    navBarStyle:
        NavBarStyle.style15, // Choose the nav bar style with this property.
  );
}

List<Widget> _buildScreens() {
  return [
    Dashboard(),
    splashScreen(),
    PostUpload(),
    AiGen(),
    PlatformList(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: Color.fromRGBO(246, 159, 29, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.up_arrow),
      title: ("Trends"),
      activeColorPrimary: Color.fromRGBO(246, 159, 29, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: CircleAvatar(
          foregroundColor: Colors.white,
          child: Icon(
            CupertinoIcons.add,
            color: Colors.black,
          )),
      activeColorPrimary: Color.fromRGBO(246, 159, 29, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: FaIcon(FontAwesomeIcons.brain),
      title: ("AI Gen"),
      activeColorPrimary: Color.fromRGBO(246, 159, 29, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: ("Profile"),
      activeColorPrimary: Color.fromRGBO(246, 159, 29, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
