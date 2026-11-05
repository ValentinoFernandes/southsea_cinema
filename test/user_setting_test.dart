import 'package:southsea_cinema/models/user_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('UserSettings defaults to empty values with a false newsletter', () {
    const UserSettings settings = UserSettings();
    expect(settings.email, isEmpty);
    expect(settings.address, isEmpty);
    expect(settings.patronNumber, isEmpty);
    expect(settings.recieveNewsLetter, isFalse);
  });
}
