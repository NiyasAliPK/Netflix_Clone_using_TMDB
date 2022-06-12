import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_app_clone/controllers/screen_home_controller.dart';
import 'package:netflix_app_clone/screens/screen_details.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenHomeController _controller = Get.put(ScreenHomeController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.height - 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 500,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/banner.webp"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 500,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                Colors.black.withOpacity(0.85),
                                Colors.black.withOpacity(0)
                              ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter)),
                        ),
                        SizedBox(
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/title_img.webp",
                                width: 300,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                  "Exciting - Sci-Fi Drama - Sci-fi Adventure",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white))
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "My List",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                              ),
                              label: const Text(
                                "Play",
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.info_outline,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Info",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Now Playing",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GetBuilder<ScreenHomeController>(
                                builder: (context) {
                              return Row(
                                  children: List.generate(
                                      _controller.nowPlayingMoviesList.length,
                                      (index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => ScreenDetails(
                                          currentMovie:
                                              _controller.nowPlayingMoviesList,
                                          indexOfmovie: index,
                                        ));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    width: 110,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.tmdb.org/t/p/w500" +
                                                  _controller
                                                          .nowPlayingMoviesList[
                                                      index]["poster_path"]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                );
                              }));
                            }),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 45),
                          child: Text(
                            "Popular on Netflix",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                                children: List.generate(
                                    _controller.topRatedMoviesList.length,
                                    (index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 8),
                                width: 110,
                                height: 160,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          _controller.topRatedMoviesList[index]
                                              ["poster_path"]),
                                )),
                              );
                            })),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 45),
                          child: Text(
                            "Trending Now",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                                children: List.generate(
                                    _controller.trendingMoviesList.length,
                                    (index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 8),
                                width: 110,
                                height: 160,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          _controller.trendingMoviesList[index]
                                              ["poster_path"]),
                                )),
                              );
                            })),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 45),
                          child: Text(
                            "Netflix Originals",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                                children: List.generate(
                                    _controller.popularMoviesList.length,
                                    (index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 8),
                                width: 110,
                                height: 160,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          _controller.popularMoviesList[index]
                                              ["poster_path"]),
                                )),
                              );
                            })),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SafeArea(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Image.asset(
                          "assets/images/logo.ico",
                          width: 35,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.collections_bookmark,
                                color: Colors.white,
                                size: 28,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/profile.jpeg",
                                fit: BoxFit.cover,
                                width: 26,
                                height: 26,
                              ))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Tv Shows",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const Text(
                        "Movies",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Row(
                        children: const [
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
