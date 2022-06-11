import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_app_clone/controllers/screen_home_controller.dart';
import 'package:netflix_app_clone/screens/root_page.dart';

void main() async {
  final ScreenHomeController _controller = Get.put(ScreenHomeController());
  await _controller.loadMovies();
  await _controller.getdata();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ScreenRootPage(),
    );
  }
}
