import 'package:blablacar/model/ride/locations.dart';
import 'package:blablacar/services/locations_service.dart';
import 'package:blablacar/widgets/inputs/bla_location_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('show filtered location and return the selected location', (tester) async {
    final dijon = Location(name: "Dijon", country: Country.france);
    final paris = Location(name: "Paris", country: Country.france);

    LocationsService.availableLocations = [dijon, paris];

    Location? selectedLocation;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () async {
                  selectedLocation = await Navigator.of(context).push<Location>(
                    MaterialPageRoute(
                      builder: (_) => BlaLocationPicker(initLocation: null),
                    ),
                  );
                },
                child: const Text("Open Picker"),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text("Open Picker"));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), "Di");
    await tester.pumpAndSettle();

    expect(find.text("Dijon"), findsOneWidget);
    expect(find.text("Paris"), findsNothing);

    await tester.tap(find.text("Dijon"));
    await tester.pumpAndSettle();

    expect(selectedLocation, isNotNull);
    expect(selectedLocation!.name, "Dijon");
  });
}
