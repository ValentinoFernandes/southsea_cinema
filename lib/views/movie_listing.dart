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
      body: Container(
        color: cinemaBackground,
        child: SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 15,
          children: [
            const Text('Jurassic Park (1993) PG'),
            const Text('Southsea Cinema Room'),
            const Text('Friday 22 Sept 2026, 18:00-20:07'),
            const Text(
                'Please note that discounts/ membership benefits will be applied once you have selected your tickets'),
            const Text('Select quantities (up to 5 in total)'),
            const Text('Tickets'),
            Row(children: [
              DropdownMenu(dropdownMenuEntries: const [
                DropdownMenuEntry(value: 0, label: '0'),
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5')
              ], initialSelection: 0,),
              const Text('Adult(£7.50)')
            ]),
            ElevatedButton(
                onPressed: () {
                  print('Add to order button pressed');
                },
                child: const Text('Add to order'))
          ],
        )),
      ),
    );
  }
}
