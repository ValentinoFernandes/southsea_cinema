import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/models/cart_item.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;
  const MovieListing({required this.movie, super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _confirmationMessage = '';

  void _addToBasket() {
    if (_ticketQuantity > 0) {
      final CartItem item = CartItem(
        movie: widget.movie,
        quantity: _ticketQuantity,
      );
      CartRepository.instance.addItem(item);
      setState(() {
        _confirmationMessage =
            'Added $_ticketQuantity ${widget.movie.name} to basket';
      });
    } else {
      setState(() {
        _confirmationMessage = 'Please select at least 1 movie';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(appTitle, style: cinemaHeaderStyle),
        actions: [const BasketButton()],
      ),
      body: Container(
        color: cinemaBackground,
        child: SizedBox(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
              Image.asset(
                widget.movie.imagePath,
                width: 200,
                height: 100,
                fit: BoxFit.fill,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Text('Order ${widget.movie.name}', style: cinemaHeaderStyle),
                  const Text(
                    'Southsea Cinema Room',
                    style: cinemaTextStyle,
                  ),
                  Text(widget.movie.showingDate, style: cinemaTextStyle),
                ],
              ),
              const Text(
                  'Please note that discounts/ membership benefits will be applied once you have selected your tickets',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: cinemaTextStyle),
              const Text('Select quantities (up to 5 in total)',
                  style: cinemaTextStyle),
              const Text('Tickets', style: cinemaTextStyle),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Row(
                      children: [
                        DropdownMenu<int>(
                          textStyle: cinemaTextStyle,
                          initialSelection: _ticketQuantity,
                          onSelected: (int? value) {
                            if (value != null) {
                              setState(() {
                                _ticketQuantity = value;
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
                        Text(
                          'Adult(${widget.movie.formattedPrice})',
                          style: cinemaTextStyle,
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
                          style: cinemaTextStyle,
                        ),
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: 'Add to Basket',
                  onPressed: _addToBasket,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _confirmationMessage,
                style: cinemaTextStyle,
              ),
              
                        ],
                      ),
            )),
      ),
    );
  }
}
