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
    test('getMovies contains valid Jurassic Park and Jurassic World Movies',
        () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie park = movies[0];
      expect(park.id, 'jurassic-park');
      expect(park.name, 'Jurassic Park');
      expect(park.ageCat, 'PG');
      expect(park.imagePath, 'assets/images/jurassic-park.jpg');
      expect(park.price, 7.5);
      expect(park.description,
          'Jurassic Park follows billionaire John Hammond, who creates a dinosaur theme park on Isla Nublar using DNA extracted from prehistoric mosquitoes preserved in amber.  To reassure nervous investors, Hammond invites paleontologist Alan Grant, paleobotanist Ellie Sattler, and mathematician Ian Malcolm to tour the facility, along with Hammond’s grandchildren, Lex and Tim.');
      expect(park.showingDate, 'Sept 14th, 18:00-20:07');

      final Movie world = movies[1];
      expect(world.id, 'jurassic-world');
      expect(world.name, 'Jurassic World');
      expect(world.ageCat, 'PG');
      expect(world.imagePath, 'assets/images/jurassic-world.jpg');
      expect(world.price, 7.5);
      expect(world.description,
          'Jurassic World (2015) is set twenty-two years after the original parks disaster, featuring a fully operational dinosaur theme park on Isla Nublar owned by Masrani Global Corporation.  To combat declining attendance, geneticists create the Indominus rex, a genetically engineered hybrid that escapes containment and goes on a rampage, forcing former Navy vet Owen Grady and operations manager Claire Dearing to lead the surviving guests to safety.');
      expect(world.showingDate, 'Oct 19th, 14:00-16:24');
    });
    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('jurassic-park');

      expect(movie, isNotNull);
      expect(movie?.name, 'Jurassic Park');
      expect(movie?.price, 7.50);
    });
    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
