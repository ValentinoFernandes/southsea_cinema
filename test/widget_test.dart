import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/screens/menu_screen.dart';
import 'package:southsea_cinema/screens/movie_listing.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieListing widget tests', () {
    List<Movie> movies = MovieRepository().getMovies();

    testWidgets('displays a MovieListing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
            home: ListView(children: [
          SizedBox(
              width: 1000, height: 1000, child: MovieListing(movie: movies[0]))
        ])),
      );

      expect(find.byType(MovieListing), findsOneWidget);
    });
  });
  group('App smoke tests', () {
    testWidgets('App displays MenuScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MenuScreen()));
      expect(find.byType(MenuScreen), findsOneWidget);
      expect(find.text('Movie Listings'), findsOneWidget);
    });

    testWidgets(
        'Displays movie cards with names, prices, date,description, age category',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: MenuScreen()));
      expect(find.text('Jurassic Park'), findsOneWidget);
      expect(find.text('September 19th, 18:20'), findsOneWidget);
      expect(find.text('12A'), findsNWidgets(2));
      expect(
          find.text(
              'An industrialist invites some experts to visit his theme park of cloned dinosaurs. After a power failure, the creatures run loose, putting everyones lives, including his grandchildrens, in danger.'),
          findsOneWidget);
      expect(find.text('Jurassic World'), findsOneWidget);
      expect(find.text('September 19th, 14:20'), findsOneWidget);
      expect(
          find.text(
              'A new theme park, built on the original site of Jurassic Park, creates a genetically modified hybrid dinosaur, the Indominus Rex, which escapes containment and goes on a killing spree.'),
          findsOneWidget);
      expect(find.text('Book Tickets'), findsNWidgets(2));
    });
  });
  testWidgets(
      'Tapping Book Tickets navigates to MovieListing with selected sandwich',
      (WidgetTester tester) async {
    tester.view.physicalSize = Size(1200, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(home: MenuScreen()));
    await tester.tap(find.text('Book Tickets').first);
    await tester.pumpAndSettle();

    expect(find.byType(MovieListing), findsOneWidget);
    expect(find.text('Book Jurassic Park'), findsOneWidget);

    await tester.tap(find.text('Add to order'));
    await tester.pump();
    expect(find.text('Ordered'), findsOneWidget);
  });
}
