import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/main.dart';
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
            home: Scaffold(
                body: Expanded(child: MovieListing(movie: movies[0])))),
      );

      expect(find.byType(MovieListing), findsOneWidget);
    });
  });
  group('App smoke tests', () {
    testWidgets('App displays MenuScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp());
      expect(find.byType(MenuScreen), findsOneWidget);
      expect(find.text('Movie Listings'), findsOneWidget);
    });

    testWidgets('Displays movie cards with names, prices, date, age category',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp());
      expect(find.text('Jurassic Park'), findsOneWidget);
      expect(find.text('£7.50'), findsOneWidget);
      expect(find.text('Jurassic World'), findsOneWidget);
      expect(find.text('£7.50'), findsOneWidget);
      expect(find.text('Book Tickets'), findsNWidgets(2));
    });
  });
  testWidgets(
      'Tapping Book Tickets navigates to MovieListing with selected sandwich',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp());
    await tester.tap(find.text('Book Tickets').first);
    await tester.pumpAndSettle();

    expect(find.byType(MovieListing), findsOneWidget);
    expect(find.text('Book Jurassic Park'), findsOneWidget);
  });
}
