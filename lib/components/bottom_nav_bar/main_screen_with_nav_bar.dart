import 'package:flutter/material.dart';
import 'package:flutter_toolkit/components/bottom_nav_bar/navbar_screen1.dart';

import 'navbar_screen2.dart';

class MainScreenWithNavBar extends StatefulWidget {
  final int? currentPageIndex;

  const MainScreenWithNavBar({super.key, this.currentPageIndex});

  @override
  State<MainScreenWithNavBar> createState() => _MainScreenWithNavBarState();
}

class _MainScreenWithNavBarState extends State<MainScreenWithNavBar> {
  late List<Widget> _screenList;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initScreens();

    if (widget.currentPageIndex != null) {
      _currentIndex = widget.currentPageIndex!;
    }
  }

  _initScreens() {
    _screenList = [NavBarScreen1(), NavBarScreen2()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screenList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            // _currentIndex = index;
          });

        },
        backgroundColor: Colors.white,
        elevation: 15.0,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        selectedItemColor: Colors.red,
        // selectedLabelStyle:,
        // unselectedLabelStyle: ,
        // backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: "Screen1",
            icon: _currentIndex == 0
                ? const Padding(
                    padding: EdgeInsets.only(bottom: 7.25),
                    child: Icon(
                      Icons.home,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  )
                : const Padding(
              padding: EdgeInsets.only(bottom: 7.25),
              child: Icon(
                Icons.home,
                color: Colors.black,
                size: 30.0,
              ),
            )
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              label: "Screen2",
              icon: _currentIndex == 0
                  ? const Padding(
                padding: EdgeInsets.only(bottom: 7.25),
                child: Icon(
                  Icons.home,
                  color: Colors.red,
                  size: 30.0,
                ),
              )
                  : const Padding(
                padding: EdgeInsets.only(bottom: 7.25),
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 30.0,
                ),
              )
          ),
      
        ],
        // ),
      ),
    );
  }
}
