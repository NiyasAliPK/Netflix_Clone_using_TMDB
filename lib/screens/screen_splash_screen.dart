import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_app_clone/controllers/screen_home_controller.dart';
import 'package:netflix_app_clone/screens/root_page.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _gotoHome();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Image.asset("assets/images/logo.ico"),
      )),
    );
  }

  _gotoHome() async {
    final ScreenHomeController _controller = Get.put(ScreenHomeController());
    await _controller.loadMovies();
    await _controller.getdata();
    Get.to(() => ScreenRootPage());
  }
}
