import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();
      expect(movies.length, 2);
    });

    test('getMovies contains valid Jurassic Park and Jurassic World movies',
        () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie park = movies[0];
      expect(park.id, 'jurassic-park');
      expect(park.name, 'Jurassic Park');
      expect(park.price, 7.5);
      expect(park.imagePath, isNotEmpty);

      final Movie world = movies[1];
      expect(world.id, 'jurassic-world');
      expect(world.name, 'Jurassic World');
      expect(world.price, 7.5);
      expect(world.imagePath, isNotEmpty);
      
    });
    test('getMovieById returns matching sandwich when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('jurassic-park');
      expect(movie, isNotNull);
      expect(movie?.name, 'Jurassic Park');
      expect(movie?.price, 7.5);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');
      expect(movie, isNull);
    });
  });
}
