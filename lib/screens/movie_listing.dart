// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieListingButtons extends StatefulWidget {
  final int maxQuantity;
  final Movie movie;
  const MovieListingButtons({super.key, this.maxQuantity = 5, required this.movie});

  @override
  _MovieListingButtons createState() => _MovieListingButtons();
}

class _MovieListingButtons extends State<MovieListingButtons> {
  String buttonText = "Add to order";

  @override
  Widget build(BuildContext context) {
    return Container(
        color: cinemaBackground,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 50,
            children: <Widget>[
              LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Row(spacing: 20, children: [
                    DropdownMenu(
                        initialSelection: 0,
                        onSelected: (int? value) {
                          setState(() {});
                        },
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: 0, label: '0'),
                          DropdownMenuEntry(value: 75, label: '1'),
                          DropdownMenuEntry(value: 150, label: '2'),
                          DropdownMenuEntry(value: 225, label: '3'),
                          DropdownMenuEntry(value: 300, label: '4'),
                          DropdownMenuEntry(value: 375, label: '5')
                        ]),
                    Text("Adult (£7.50)")
                  ]);
                } else {
                  return Column(spacing: 20, children: [
                    DropdownMenu(
                        initialSelection: 0,
                        onSelected: (int? value) {
                          setState(() {});
                        },
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: 0, label: '0'),
                          DropdownMenuEntry(value: 75, label: '1'),
                          DropdownMenuEntry(value: 150, label: '2'),
                          DropdownMenuEntry(value: 225, label: '3'),
                          DropdownMenuEntry(value: 300, label: '4'),
                          DropdownMenuEntry(value: 375, label: '5')
                        ]),
                    Text("Adult (${widget.movie.formattedPrice})")
                  ]);
                }
              }),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: BeveledRectangleBorder(),
                      backgroundColor: cinemaBrand,
                      foregroundColor: cinemaFontWhite),
                  onPressed: () {
                    setState(() {
                      if (buttonText == "Add to order") {
                        buttonText = "Ordered";
                      } else {}
                    });
                  },
                  child: Text(buttonText))
            ]));
  }
}

class MovieListing extends StatelessWidget {
  final Movie movie;
  const MovieListing({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Book ${movie.name}')),
        backgroundColor: cinemaSurface,
        drawer: const NavDrawer(),
        body: Container(
          color: cinemaBackground,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 50,
              children: [
                Text("${movie.name} ${movie.ageCat}",
                    style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                Image.asset(movie.imagePath,
                    width: 200, height: 300, fit: BoxFit.cover),
                Text(movie.showingDate,
                    style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    )),
                Text(movie.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: cinemaFontWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    )),
                MovieListingButtons(movie: movie),
              ]),
        ));
  }
}
