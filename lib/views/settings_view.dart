import 'package:material_ui/material_ui.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/user_settings.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefPatronNumber = 'patron_number';
const String prefAddress = 'user_address';
const String prefEmail = 'user_email';
const String prefNewsletter = 'user_newsletter';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() {
    return _SettingsScreenState();
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> _loadSettings() async {
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    final String? savedPatronNumber = await prefs.getString(prefPatronNumber);
    final String? savedAddress = await prefs.getString(prefAddress);
    final String? savedEmail = await prefs.getString(prefEmail);
    final bool? savedNewsletter = await prefs.getBool(prefNewsletter);
    String name = '';
    if (savedPatronNumber != null) {
      name = savedPatronNumber;
    }

    String address = '';
    if (savedAddress != null) {
      address = savedAddress;
    }

    String email = '';
    if (savedEmail != null) {
      email = savedEmail;
    }
    bool newsletter = false;
    if (savedNewsletter != null) {
      newsletter = savedNewsletter;
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _patronNumberController.text = name;
      _addressController.text = address;
      _emailController.text = email;
      _receiveNewsletter = newsletter;
    });
  }

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
    _loadSettings();
  }

  @override
  void dispose() {
    _patronNumberController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }


  Future<void> _saveSettings() async {
    final String patronNumber = _patronNumberController.text.trim();
    final String address = _addressController.text.trim();
    final String email = _emailController.text.trim();
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setString(prefPatronNumber, patronNumber);
    await prefs.setString(prefAddress, address);
    await prefs.setString(prefEmail, email);
    await prefs.setBool(prefNewsletter, _receiveNewsletter);
    final UserSettings settings = UserSettings(
      patronNumber: patronNumber,
      address: address,
      email: email,
      recieveNewsLetter: _receiveNewsletter,
    );
    if (!mounted) {
      return;
    }
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
                style: cinemaTextStyle,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Patron Number',
                    hintText: 'Enter your patron number',
                    labelStyle: cinemaTextStyle,
                    helperStyle: cinemaTextStyle),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _addressController,
                maxLines: 3,
                style: cinemaTextStyle,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Customer address',
                    hintText: 'Enter your address',
                    labelStyle: cinemaTextStyle,
                    helperStyle: cinemaTextStyle),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                style: cinemaTextStyle,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email address',
                    hintText: 'Enter your email',
                    labelStyle: cinemaTextStyle,
                    helperStyle: cinemaTextStyle),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Receive newsletter and offers',
                      style: cinemaTextStyle,
                    ),
                  ),
                  Switch(
                    value: _receiveNewsletter,
                    activeThumbColor: cinemaBrandLight,
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
                child: 
                  PrimaryButton(
                    label: 'Save Settings',
                    onPressed: _saveSettings,
                  )
              ),
              if (_confirmationMessage.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  _confirmationMessage,
                  style: cinemaTextStyle,
                ),
              ],
            ])));
  }
}
