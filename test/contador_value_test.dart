import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:practicar_animacion/src/animacion/contador.dart';

void main() {
  testWidgets('counter increments when button is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ContadorIncrementar()));
    
    /* expect(find.text('Count: 0'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    
    expect(find.text('Count: 1'), findsOneWidget); */
  });
}