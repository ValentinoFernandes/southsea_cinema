import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
          id: 'jurassic-park',
          name: 'Jurassic Park',
          description:
              'An industrialist invites some experts to visit his theme park of cloned dinosaurs. After a power failure, the creatures run loose, putting everyones lives, including his grandchildrens, in danger.',
          price: 7.50,
          imagePath: 'assests/images/Jurassic-Park.jpg'),
      Movie(
          id: 'jurassic-world',
          name: 'Jurassic World',
          description:
              'A new theme park, built on the original site of Jurassic Park, creates a genetically modified hybrid dinosaur, the Indominus Rex, which escapes containment and goes on a killing spree.',
          price: 7.50,
          imagePath: 'assests/images/Jurassic-World.jpg')
    ];
  }
}
