import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('App displays HomeView as home', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeView()));
      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema'), findsOneWidget);
      expect(find.byIcon(Icons.shopping_basket), findsOneWidget);
    });

    testWidgets('Displays movie cards with names and prices',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeView()));
      expect(find.text('Jurassic Park'), findsOneWidget);
      expect(find.text('Jurassic World'), findsOneWidget);
      expect(find.text('Order'), findsNWidgets(2));
    });
    testWidgets('Tapping Order Navigates to MovieListing with selected movie',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeView()));
      await tester.tap(find.text('Order').first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Order Jurassic Park'), findsOneWidget);

      await tester.tap(find.text('Add to order'));
      await tester.pumpAndSettle();
      expect(find.text('You ordered 1 tickets'), findsOneWidget);
    });
  });
}
