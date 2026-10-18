import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

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
        child: SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            const Text('Jurassic Park (1993) PG',
                style: TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            const Text('Southsea Cinema Room',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 16,
                )),
            const Text('Friday 22 Sept 2026, 18:00-20:07',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 16,
                )),
            const Text(
                'Please note that discounts/ membership benefits will be applied once you have selected your tickets',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 16,
                )),
            const Text('Select quantities (up to 5 in total)',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 16,
                )),
            const Text('Tickets',
                style: TextStyle(
                  color: cinemaFontWhite,
                  fontSize: 16,
                )),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return Row(
                    children: [
                      DropdownMenu<int>(
                        initialSelection: _ticketQuantity,
                        onSelected: (int? value) {
                          if (value != null) {
                            setState(() {
                              _ticketQuantity = value;
                              print('Tickets selected: $_ticketQuantity');
                            });
                          }
                        },
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: 1, label: '1'),
                          DropdownMenuEntry(value: 2, label: '2'),
                          DropdownMenuEntry(value: 3, label: '3'),
                          DropdownMenuEntry(value: 4, label: '4'),
                          DropdownMenuEntry(value: 5, label: '5'),
                        ],
                      ),
                      const Text(
                        'Adult(£7.50)',
                        style: TextStyle(
                          color: cinemaFontWhite,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      DropdownMenu<int>(
                        initialSelection: _ticketQuantity,
                        onSelected: (int? value) {
                          if (value != null) {
                            setState(() {
                              _ticketQuantity = value;
                              print('Tickets selected: $_ticketQuantity');
                            });
                          }
                        },
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: 1, label: '1'),
                          DropdownMenuEntry(value: 2, label: '2'),
                          DropdownMenuEntry(value: 3, label: '3'),
                          DropdownMenuEntry(value: 4, label: '4'),
                          DropdownMenuEntry(value: 5, label: '5'),
                        ],
                      ),
                      const Text(
                        'Adult(£7.50)',
                        style: TextStyle(
                          color: cinemaFontWhite,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),

            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _bookingMessage = 'You ordered $_ticketQuantity tickets';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: cinemaFontWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text('Add to order')),
            Text(
              _bookingMessage,
              style: TextStyle(
                color: cinemaFontWhite,
                fontSize: 16,
              ),
            )
          ],
        )),
      ),
    );
  }
}
