import 'package:flutter/material.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Center(
                child: Text(
          "Screen Settings",
          style: TextStyle(color: Colors.white),
        ))));
  }
}
