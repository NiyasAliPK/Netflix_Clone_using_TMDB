import 'package:flutter/material.dart';

class ScreenDetails extends StatelessWidget {
  final List currentMovie;
  final int indexOfmovie;

  const ScreenDetails(
      {Key? key, required this.currentMovie, required this.indexOfmovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://image.tmdb.org/t/p/w500" +
                        currentMovie[indexOfmovie]["backdrop_path"]))),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${currentMovie[indexOfmovie]["original_title"]}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text("${currentMovie[indexOfmovie]["overview"]}",
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 15,
              )),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 5.0, bottom: 10),
                child: Text(
                  "More Like This",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: currentMovie.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 110,
                        height: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500" +
                                      currentMovie[index]["poster_path"]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
