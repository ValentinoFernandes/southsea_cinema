import 'package:southsea_cinema/models/movie.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    final List<Movie>? cachedSandwiches = _cachedMovies;
    if (cachedSandwiches != null) {
      return cachedSandwiches;
    }
    return const [
      Movie(
          id: 'jurassic-park',
          name: 'Jurassic Park',
          description:
              'Jurassic Park follows billionaire John Hammond, who creates a dinosaur theme park on Isla Nublar using DNA extracted from prehistoric mosquitoes preserved in amber.  To reassure nervous investors, Hammond invites paleontologist Alan Grant, paleobotanist Ellie Sattler, and mathematician Ian Malcolm to tour the facility, along with Hammond’s grandchildren, Lex and Tim.',
          price: 7.5,
          imagePath: 'assets/images/jurassic-park.jpg',
          ageCat: 'PG',
          showingDate: 'Sept 14th, 18:00-20:07'),
      Movie(
          id: 'jurassic-world',
          name: 'Jurassic World',
          description:
              'Jurassic World (2015) is set twenty-two years after the original parks disaster, featuring a fully operational dinosaur theme park on Isla Nublar owned by Masrani Global Corporation.  To combat declining attendance, geneticists create the Indominus rex, a genetically engineered hybrid that escapes containment and goes on a rampage, forcing former Navy vet Owen Grady and operations manager Claire Dearing to lead the surviving guests to safety.',
          price: 7.5,
          imagePath: 'assets/images/jurassic-world.jpg',
          ageCat: 'PG',
          showingDate: 'Oct 19th, 14:00-16:24')
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }
}
