import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

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
        //body: const SizedBox.shrink(
        body: Container(
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
              Row(
                children: [Text("Adult (£7.50)")])
            ])));
  }
}
