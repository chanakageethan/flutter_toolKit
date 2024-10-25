import 'package:flutter/material.dart';


class NavBarScreen1 extends StatefulWidget {
  const NavBarScreen1({super.key});

  @override
  State<NavBarScreen1> createState() => _NavBarScreen1State();
}

class _NavBarScreen1State extends State<NavBarScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("Screen 1"),),
    );
  }
}
