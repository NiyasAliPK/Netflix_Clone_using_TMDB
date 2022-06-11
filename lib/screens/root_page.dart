import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_app_clone/controllers/navigation_controller.dart';
import 'package:netflix_app_clone/screens/screen_coming_soon.dart';
import 'package:netflix_app_clone/screens/screen_home.dart';
import 'package:netflix_app_clone/screens/screen_search.dart';
import 'package:netflix_app_clone/screens/screen_settings.dart';

class ScreenRootPage extends StatelessWidget {
  ScreenRootPage({Key? key}) : super(key: key);

  final _pages = [
    const ScreenHome(),
    const ScreenComingSoon(),
    const ScreenSearch(),
    const ScreenSettings()
  ];

  final NavigationController _controller = Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: GetBuilder<NavigationController>(
          builder: (context) {
            return _pages[_controller.pageIndex];
          },
        )),
        bottomNavigationBar:
            GetBuilder<NavigationController>(builder: (context) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomNavigationBar(
                backgroundColor: Colors.black,
                currentIndex: _controller.pageIndex,
                onTap: ((newIndex) {
                  _controller.onClick(newIndex);
                }),
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 30,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.play_circle,
                        size: 30,
                        color: Colors.white,
                      ),
                      label: 'Coming Soon'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      label: 'Search'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.white,
                      ),
                      label: 'Settings'),
                ]),
          );
        }));
  }
}
