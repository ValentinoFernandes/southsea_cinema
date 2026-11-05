import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

const Movie testMovie = Movie(
    id: 'test',
    name: 'Test Movie',
    description: 'test',
    ageCat: 'pg',
    imagePath: 'assets/images/jurassic-park.jpg',
    price: 7.0,
    showingDate: 'test date');

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });

  testWidgets('Adding to basket without selecting quantity shows warning', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: MovieListing(movie: testMovie)),
    );

    await tester.tap(find.text('Add to Basket'));
    await tester.pump();

    expect(find.text('Please select at least 1 movie'), findsOneWidget);
    expect(CartRepository.instance.getItems(), isEmpty);
  });

  testWidgets('Adding to basket records quantity and Movie', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: MovieListing(movie: testMovie)),
    );

    await tester.tap(find.byIcon(Icons.arrow_drop_down).first);
    await tester.pump();

    await tester.tap(find.text('2').last);
    await tester.pump();

    await tester.tap(find.text('Add to Basket'));
    await tester.pump();

    final List<CartItem> items = CartRepository.instance.getItems();
    expect(items.length, 1);

    final CartItem added = items.first;
    expect(added.quantity, 2);
    expect(added.movie.id, 'test');
    expect(added.movie.name, 'Test Movie');
    expect(find.text('Added 2 Test Movie to basket'), findsOneWidget);
  });
}
