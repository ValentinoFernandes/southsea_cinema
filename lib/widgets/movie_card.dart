import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaBackground,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  movie.imagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 15,
                      children: [
                        Text(
                          movie.name,
                          style: const TextStyle(
                            color: cinemaBrand,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movie.ageCat,
                          style: const TextStyle(
                            color: cinemaFontMuted,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.description,
                      style: const TextStyle(color: cinemaFontWhite),
                    ),
                  ],
                )),
                const SizedBox(height: 16),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Book tickets now!',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: cinemaFontWhite),
                ),
                Text(
                  movie.showingDate,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: cinemaFontWhite),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(cinemaBrand),
                      foregroundColor: WidgetStatePropertyAll(cinemaFontWhite)),
                  onPressed: () {},
                  child: const Text('Book Tickets'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
