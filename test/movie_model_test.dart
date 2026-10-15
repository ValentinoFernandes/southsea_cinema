import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';


void main() {
  group('Movie model test', () {
    test('creates Movie instance with these properties', () {
      const movie = Movie(
        id: 'the-lost-world',
        imagePath: 'assets/images/the-lost-world',
        name: 'The Lost World',
        showingDate: '12th October 12:05',
        description: 'This is a test description',
        price: 7,
        ageCat: 'PG',
      );
      expect(movie.id, 'the-lost-world');
      expect(movie.name, 'The Lost World');
      expect(movie.ageCat, 'PG');
      expect(movie.price, 7);
      expect(movie.description, 'This is a test description');
      expect(movie.showingDate, '12th October 12:05');
      expect(movie.imagePath, 'assets/images/the-lost-world');
    });
    test(
        'formattedPrice returns price prefixed with pound sign and two decimal places',
        () {
      const movie = Movie(
        id: 'jurassic-park',
        imagePath: 'assets/images/jurassic-park',
        name: 'Jurassic Park',
        showingDate: '12th October 22:05',
        description: 'This is a diffrent test description',
        price: 7.5,
        ageCat: 'PG',
      );
      expect(movie.formattedPrice, '£7.50');
    });

  });
}
