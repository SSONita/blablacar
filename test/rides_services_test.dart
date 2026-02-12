// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:blablacar/dummy_data/dummy_data.dart';
import 'package:blablacar/model/ride/locations.dart';
import 'package:blablacar/model/ride/ride.dart';
import 'package:blablacar/services/rides_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

///
/// Test rides service filter methods
///
  test('should return 1 ride', () {
    RidesService.availableRides = [
      Ride(
        departureLocation: Location(name: "Dijon", country: Country.france),
        arrivalLocation: Location(name: "Paris", country: Country.france),
        departureDate: DateTime.now(),
        arrivalDateTime: DateTime.now().add(Duration(hours: 3)),
        driver: fakeUsers[0],
        availableSeats: 3,
        pricePerSeat: 10,
      ),

      Ride(
        departureLocation: Location(name: "Dijon", country: Country.france),
        arrivalLocation: Location(name: "Paris", country: Country.france),
        departureDate: DateTime.now(),
        arrivalDateTime: DateTime.now().add(Duration(hours: 3)),
        driver: fakeUsers[0],
        availableSeats: 1,
        pricePerSeat: 10,
      ),
    ];

    final result = RidesService.filterBy(
      departure: Location(name: "Dijon", country: Country.france),
      seatRequested: 2,
    );

    expect(result.length, 1);
  });
}
