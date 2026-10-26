import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaBackground,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  height: 100,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            movie.name,
                            style: cinemaHeaderStyle,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            movie.ageCat,
                            style: cinemaTextStyle,
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.description,
                        style: cinemaTextStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        movie.showingDate,
                        style: cinemaTextStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '£${movie.price.toStringAsFixed(2)}',
                  style: cinemaTextStyle,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: cinemaFontWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MovieListing(movie: movie);
                        },
                      ),
                    );
                  },
                  child: const Text('Order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
