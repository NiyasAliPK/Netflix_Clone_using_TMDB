import 'dart:convert';

import 'package:get/get.dart';
import 'package:netflix_app_clone/models/api_model/api_model.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:http/http.dart' as http;

class ScreenHomeController extends GetxController {
  final String API_KEY = "9574409cdab7e0b0a6d63dc89d8f5ae8";
  final String ACCESS_TOKEN =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NTc0NDA5Y2RhYjdlMGIwYTZkNjNkYzg5ZDhmNWFlOCIsInN1YiI6IjYyYTM2MzA2MDViNTQ5MmY5ZWY3NDE4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aLo1ZDiQMSz2UOAW45QAkY-DO2SEmE5LstmuLsAJ29A";
  late List trendingMoviesList = [];
  late List topRatedMoviesList = [];
  late List popularMoviesList = [];
  late List nowPlayingMoviesList = [];
  late List<ApiModel> comingSoonList = [];

  loadMovies() async {
    TMDB customLogs = TMDB(ApiKeys(API_KEY, ACCESS_TOKEN),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map tredingMoviesTMDB = await customLogs.v3.trending.getTrending();
    Map topRatedMoviesTMDB = await customLogs.v3.movies.getTopRated();
    Map popularMoviesTMDB = await customLogs.v3.movies.getPopular();
    Map nowPlayingMoviesTMDB = await customLogs.v3.movies.getNowPlaying();

    trendingMoviesList = tredingMoviesTMDB['results'];
    topRatedMoviesList = topRatedMoviesTMDB['results'];
    popularMoviesList = popularMoviesTMDB['results'];
    nowPlayingMoviesList = nowPlayingMoviesTMDB['results'];
    update();
  }

  Future<List<ApiModel>> fetchAllMovie() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=477d29afe1c129fc2b73bd112626d490'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["results"];
      return list.map((movie) => ApiModel.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movie");
    }
  }

  getdata() async {
    comingSoonList = await fetchAllMovie();
  }
}
