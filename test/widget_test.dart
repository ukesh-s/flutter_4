import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:experiment_4/main.dart';

void main() {
  testWidgets('validates mileage form and calculates result', (tester) async {
    await tester.pumpWidget(const MileageApp());
    expect(find.text('Car Mileage Calculator'), findsOneWidget);
    await tester.tap(find.text('Calculate mileage'));
    await tester.pumpAndSettle();
    expect(find.text('Enter a number greater than zero'), findsNWidgets(2));
    await tester.enterText(find.widgetWithText(TextFormField, 'Distance travelled (km)'), '360');
    await tester.enterText(find.widgetWithText(TextFormField, 'Fuel used (litres)'), '30');
    await tester.tap(find.text('Calculate mileage'));
    await tester.pumpAndSettle();
    expect(find.text('12.00 km/L'), findsOneWidget);
  });
}
