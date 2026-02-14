import 'package:blablacar/model/ride/locations.dart';
import 'package:blablacar/model/ride_pref/ride_pref.dart';
import 'package:blablacar/screens/ride_pref/widgets/ride_pref_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('swap button switch the location', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RidePrefForm(
            initRidePref: RidePref(
              departure: Location(name: "Dijon", country: Country.france),
              arrival: Location(name: "Paris", country: Country.france),
              departureDate: DateTime.now(),
              requestedSeats: 1,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.swap_vert));
    await tester.pump();

    expect(find.text("Paris"), findsOneWidget);
    expect(find.text("Dijon"), findsOneWidget);
  });
}
