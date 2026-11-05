import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';


class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() {
    return _BasketScreenState();
  }
}

class _BasketScreenState extends State<BasketScreen> {
  String _confirmationMessage = '';

  @override
  Widget build(BuildContext context) {
    final CartRepository cart = CartRepository.instance;
    final List<CartItem> items = cart.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        actions: const [BasketButton()],
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text('Basket placeholder'),
      ),
    );
  }
}