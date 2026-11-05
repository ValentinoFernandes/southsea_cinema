import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/user_settings.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _patronNumberController;
  late TextEditingController _addressController;
  late TextEditingController _emailController;
  bool _receiveNewsletter = false;
  String _confirmationMessage = '';

  @override
  void initState() {
    super.initState();
    _patronNumberController = TextEditingController();
    _addressController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _patronNumberController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveSettings() {
    final String name = _patronNumberController.text.trim();
    final String address = _addressController.text.trim();
    final String email = _emailController.text.trim();

    final UserSettings settings = UserSettings(
      patronNumber: name,
      address: address,
      email: email,
      recieveNewsLetter: _receiveNewsletter,
    );

    setState(() {
      _confirmationMessage = 'Settings saved for ${settings.patronNumber}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
          actions: const [BasketButton()],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Customer Profile', style: cinemaHeaderStyle),
              const SizedBox(height: 16),
              TextField(
                controller: _patronNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Patron Number',
                  hintText: 'Enter your patron number',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _addressController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Customer address',
                  hintText: 'Enter your address',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email address',
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: Text('Receive newsletter and offers'),
                  ),
                  Switch(
                    value: _receiveNewsletter,
                    onChanged: (bool value) {
                      setState(() {
                        _receiveNewsletter = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  label: 'Save Settings',
                  onPressed: _saveSettings,
                ),
              ),
              if (_confirmationMessage.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  _confirmationMessage,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ])));
  }
}
