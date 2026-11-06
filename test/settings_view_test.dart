import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
  });
  testWidgets('SettingsScreen displays form fields and switches', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

    expect(find.text('Customer Profile'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.byType(Switch), findsOneWidget);
    expect(find.text('Save Settings'), findsOneWidget);
  });
  testWidgets('Toggling switch and saving settings updates state', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));

    final Finder patronNumberField =
        find.widgetWithText(TextField, 'Patron Number');
    final Finder addressField =
        find.widgetWithText(TextField, 'Customer address');
    final Finder emailField = find.widgetWithText(TextField, 'Email address');

    await tester.enterText(patronNumberField, '1245');
    await tester.enterText(addressField, '10 southbound Ave, Portsmouth');
    await tester.enterText(emailField, 'drew@example.com');

    final Finder switchFinder = find.byType(Switch);
    expect(tester.widget<Switch>(switchFinder).value, isFalse);
    await tester.tap(switchFinder);
    await tester.pump();
    expect(tester.widget<Switch>(switchFinder).value, isTrue);

    await tester.tap(find.text('Save Settings'));
    await tester.pump();

    expect(find.text('Settings saved for 1245'), findsOneWidget);
    await tester.enterText(patronNumberField, '2525');
    await tester.enterText(addressField, 'Guildhall, PO1 2AJ');
    await tester.enterText(
      emailField,
      '2525@portsmouthcc.gov.uk',
    );
    await tester.tap(find.text('Save Settings'));
    await tester.pump();
    expect(
      find.text('Settings saved for 2525'),
      findsOneWidget,
    );
    final SharedPreferencesAsync prefs = SharedPreferencesAsync();
    expect(await prefs.getString(prefPatronNumber), '2525');
    expect(await prefs.getString(prefAddress), 'Guildhall, PO1 2AJ');
    expect(
      await prefs.getString(prefEmail),
      '2525@portsmouthcc.gov.uk',
    );
    expect(await prefs.getBool(prefNewsletter), isTrue);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));
    await tester.pumpAndSettle();
    expect(find.text('2525'), findsOneWidget);
    expect(find.text('Guildhall, PO1 2AJ'), findsOneWidget);
    expect(
      find.text('2525@portsmouthcc.gov.uk'),
      findsOneWidget,
    );
    final Switch reopenedSwitch = tester.widget<Switch>(find.byType(Switch));
    expect(reopenedSwitch.value, isTrue);
  });
  testWidgets('SettingsScreen pre-fills saved settings on open', (
    WidgetTester tester,
  ) async {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.withData(<String, Object>{
      prefPatronNumber: '2241',
      prefAddress: 'Portsmouth Guildhall',
      prefEmail: '2241@portsmouthcc.gov.uk',
      prefNewsletter: true,
    });
    await tester.pumpWidget(const MaterialApp(home: SettingsScreen()));
    await tester.pumpAndSettle();

    expect(find.text('2241'), findsOneWidget);
    expect(find.text('Portsmouth Guildhall'), findsOneWidget);
    expect(find.text('2241@portsmouthcc.gov.uk'), findsOneWidget);
    final Switch switchWidget = tester.widget<Switch>(find.byType(Switch));
    expect(switchWidget.value, isTrue);
  });
}
