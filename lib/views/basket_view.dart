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

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: Text(
          'Your basket is empty',
          style: cinemaTextStyle,
        ),
      ),
    );
  }

  Widget _buildTotalRow(String label, String value, {bool emphasise = false}) {
    final TextStyle style;
    if (emphasise) {
      style = const TextStyle(
          color: cinemaFontWhite, fontWeight: FontWeight.bold, fontSize: 16);
    } else {
      style = const TextStyle(color: cinemaFontWhite);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: cinemaTextStyle),
          Text(value, style: cinemaTextStyle),
        ],
      ),
    );
  }

  Widget _buildLineItem(CartRepository cart, CartItem item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.quantity} Tickets',
                  style: cinemaTextStyle,
                ),
                Text(
                    '${item.movie.name},${item.movie.showingDate}, southsea cinema room',
                    style: cinemaTextStyle),
                const SizedBox(height: 4),
                Text('£${item.lineTotal.toStringAsFixed(2)}',
                    style: cinemaTextStyle),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              setState(() {
                cart.removeItem(index);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBasketList(CartRepository cart, List<CartItem> items) {
    final List<Widget> children = [];

    children.add(const Text('Your basket', style: cinemaHeaderStyle));
    children.add(const SizedBox(height: 16));

    for (int index = 0; index < items.length; index++) {
      final CartItem item = items[index];
      children.add(_buildLineItem(cart, item, index));
    }
    children.add(const SizedBox(height: 24));
    children.add(_buildTotalRow(
      'Service charge',
       '£4.0'));
    children.add(const SizedBox(height: 24));
    children.add(
      _buildTotalRow(
        'Items total',
        '£${cart.getTotal().toStringAsFixed(2)}',
      ),
    );

    children.add(const SizedBox(height: 24));

    children.add(
      SizedBox(
        width: double.infinity,
        child: PrimaryButton(
          label: 'Checkout',
          onPressed: () {
            setState(() {
              cart.clear();
              _confirmationMessage = 'Thanks, your order has been confirmed';
            });
          },
        ),
      ),
    );

    if (_confirmationMessage.isNotEmpty) {
      children.add(const SizedBox(height: 12));
      children.add(
        Text(
          _confirmationMessage,
          style: cinemaHeaderStyle,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CartRepository cart = CartRepository.instance;
    final List<CartItem> items = cart.getItems();

    final Widget content;
    if (items.isEmpty) {
      if (_confirmationMessage.isNotEmpty) {
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmptyState(),
            const SizedBox(height: 12),
            Text(
              _confirmationMessage,
              style: cinemaHeaderStyle,
            ),
          ],
        );
      } else {
        content = _buildEmptyState();
      }
    } else {
      content = _buildBasketList(cart, items);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        actions: const [BasketButton()],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }
}
