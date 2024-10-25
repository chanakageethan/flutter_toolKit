import 'package:flutter/material.dart';


class NavBarScreen2 extends StatefulWidget {
  const NavBarScreen2({super.key});

  @override
  State<NavBarScreen2> createState() => _NavBarScreen2State();
}

class _NavBarScreen2State extends State<NavBarScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text("Screen 2"),),
    );
  }
}