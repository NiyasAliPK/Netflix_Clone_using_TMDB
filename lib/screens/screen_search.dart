import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_app_clone/controllers/screen_home_controller.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenHomeController _controller = Get.put(ScreenHomeController());
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.withOpacity(0.25)),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.withOpacity(0.7),
                  )),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Top Searches",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                    children: List.generate(
                        _controller.topRatedMoviesList.length, (index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 36) * 0.8,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w500" +
                                                      _controller
                                                              .topRatedMoviesList[
                                                          index]["poster_path"]),
                                              fit: BoxFit.cover)),
                                    ),
                                    Container(
                                        height: 70,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.2)))
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width:
                                      (MediaQuery.of(context).size.width - 30) *
                                          0.4,
                                  child: Text(
                                    _controller.topRatedMoviesList[index]
                                        ["title"],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 36) * 0.2,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 2, color: Colors.white),
                                  color: Colors.black.withOpacity(0.4)),
                              child: const Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }))
              ],
            ),
          ),
        ));
  }
}
