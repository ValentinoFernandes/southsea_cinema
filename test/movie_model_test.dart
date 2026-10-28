import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('create movie instance with given properties', () {
      const movie = Movie(
          ageCat: 'PG',
          price: 7.5,
          name: 'Jurassic Park',
          id: 'jurassic-park',
          description: 'this is a test description',
          imagePath: 'assets/images/jurassic-park.jpg',
          showingDate: 'Oct 19th');
      expect(movie.ageCat, 'PG');
      expect(movie.price, 7.5);
      expect(movie.name, 'Jurassic Park');
      expect(
        movie.id,
        'jurassic-park',
      );
      expect(movie.description, 'this is a test description');
      expect(movie.imagePath, 'assets/images/jurassic-park.jpg');
      expect(movie.showingDate, 'Oct 19th');
    });
    test(
        'formattedPrice returns the price prefixed with the pound sign to two decimal places',
        () {
      const movie = Movie(
          ageCat: 'PG',
          price: 7.5,
          name: 'Jurassic World',
          id: 'jurassic-World',
          description: 'this is a test description',
          imagePath: 'assets/images/jurassic-world.jpg',
          showingDate: 'Oct 19th');

      expect(movie.formattedPrice, '£7.50');
    });
  });
}
