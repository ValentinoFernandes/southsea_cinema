import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Text(
                            movie.ageCat,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.description,
                        style: const TextStyle(color: Colors.black54),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(movie.showingDate, style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),)
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
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
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
