import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_project/view/Test/chat.dart';
import 'package:nike_project/view/Test/dash_board.dart';
import 'package:nike_project/view/Test/profile.dart';
import 'package:nike_project/view/Test/setting.dart';
import 'package:nike_project/view/common/Button/material_button.dart';
import 'package:nike_project/view/contants/contants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Dashboard(),
    Chat(),
    Profile(),
    Settings(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: screens.elementAt(currentTab),
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () {},
          backgroundColor: colorButton),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomAppBar(),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButtonCustoms(
                  content: "DashBoard",
                  icon: Icons.dashboard,
                  index: 0,
                  currentTab: currentTab,
                  onPressedFunction: () {
                    setState(() {
                      currentScreen =
                          Dashboard(); // if user taps on this dashboard tab will be active
                      currentTab = 0;
                    });
                  },
                ),
                MaterialButtonCustoms(
                  content: "Chat",
                  icon: Icons.chat,
                  index: 1,
                  currentTab: currentTab,
                  onPressedFunction: () {
                    setState(() {
                      currentScreen =
                          Chat(); // if user taps on this dashboard tab will be active
                      currentTab = 1;
                    });
                  },
                ),
              ],
            ),

            // Right Tab bar icons

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButtonCustoms(
                  content: 'Profile',
                  icon: Icons.person,
                  index: 2,
                  currentTab: currentTab,
                  onPressedFunction: () {
                    setState(() {
                      currentScreen =
                          Profile(); // if user taps on this dashboard tab will be active
                      currentTab = 2;
                    });
                  },
                ),
                MaterialButtonCustoms(
                  content: 'Setting',
                  icon: Icons.settings,
                  index: 3,
                  currentTab: currentTab,
                  onPressedFunction: () {
                    setState(() {
                      currentScreen =
                          Settings(); // if user taps on this dashboard tab will be active
                      currentTab = 3;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
