import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'jurassic-park',
        name: 'Jurassic Park',
        description: 'Jurassic Park follows billionaire John Hammond, who creates a dinosaur theme park on Isla Nublar using DNA extracted from prehistoric mosquitoes preserved in amber.  To reassure nervous investors, Hammond invites paleontologist Alan Grant, paleobotanist Ellie Sattler, and mathematician Ian Malcolm to tour the facility, along with Hammond’s grandchildren, Lex and Tim.',
        price: 7.5,
        imagePath: 'assets/images/jurassic-park.jpg',
        ageCat: 'PG',
        showingDate: 'Sept 14th, 18:00-20:07'
      ),
      Movie(
        id: 'jurassic-world',
        name: 'Jurassic World',
        description: 'Jurassic World (2015) is set twenty-two years after the original parks disaster, featuring a fully operational dinosaur theme park on Isla Nublar owned by Masrani Global Corporation.  To combat declining attendance, geneticists create the Indominus rex, a genetically engineered hybrid that escapes containment and goes on a rampage, forcing former Navy vet Owen Grady and operations manager Claire Dearing to lead the surviving guests to safety.',
        price: 7.5,
        imagePath: 'assets/images/jurassic-world.jpg',
        ageCat: 'PG',
        showingDate: 'Oct 19th, 14:00-16:24'
      )
    ];
  }
}
