// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListingButtons extends StatefulWidget {
  const MovieListingButtons({super.key});

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
            children: [
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
                Text("Adult (£7.50)")
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
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
          backgroundColor: cinemaSurface,
          iconTheme: const IconThemeData(color: cinemaBrand),
          elevation: 0,
        ),
        drawer: const NavDrawer(),
        body: Container(
          color: cinemaBackground,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 50,
                children: [
              Text("Jurassic Park (1993) PG",
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Southsea Cinema Room",
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  )),
              Text("Sunday 27th Sept 2026, 14:00 - ends at 16:07",
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  )),
              Text(
                  "Please note that Discounts/ Membership Benefits will be applied once you have selected your tickets",
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  )),
              Text("Select Quantities (Up to 5 in total)",
                  style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  )),
              MovieListingButtons(),
            ])));
  }
}
