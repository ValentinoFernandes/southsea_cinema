import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:flutter/services.dart';

void main() {
  setUp(() {
    rootBundle.clear();
  });
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
      await tester.pumpAndSettle();
      expect(find.text('Jurassic Park'), findsOneWidget);
      expect(find.text('Jurassic World'), findsOneWidget);
      expect(find.text('Order'), findsWidgets);
      await tester.scrollUntilVisible(find.text('The Land Before Time'), 150);
      await tester.pumpAndSettle();
      expect(find.text('£6.50'), findsOneWidget);
      await tester.scrollUntilVisible(find.text('Nonexistent Movie'), 150);
      await tester.pumpAndSettle();
      expect(find.text('£0.00'), findsOneWidget);
      expect(find.text('Image unavailable'), findsOneWidget);
      expect(tester.takeException(), isNull);
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
