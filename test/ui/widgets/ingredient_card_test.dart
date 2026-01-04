import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/ui/widgets/ingredient_card.dart';

Widget _buildWrappedWidget(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: ListView(
        children: [
          child,
        ],
      ),
    ),
  );
}

void main() {
  const mockIngredientName = 'colby jack cheese';

  group('IngredientCard', () {
    testWidgets("can build", (WidgetTester tester) async {
      // TODO: Arrange
      await tester.pumpWidget(_buildWrappedWidget(IngredientCard(
          name: mockIngredientName, initiallyChecked: false, evenRow: true, onChecked: (isChekcked) {})));

      // TODO: Act
      final cardFinder = find.byType(IngredientCard);
      final titleFinder = find.text(mockIngredientName);

      // TODO: Assert
      expect(cardFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('can be checked when tapped', (tester) async {
      bool isChecked = false;
      // TODO: Arrange
      await tester.pumpWidget(_buildWrappedWidget(IngredientCard(
          name: mockIngredientName,
          initiallyChecked: false,
          evenRow: true,
          onChecked: (newValue) {
            isChecked = newValue;
          })));

      // TODO: Act
      final cardFinder = find.byType(IngredientCard);

      await tester.tap(cardFinder);
      await tester.pumpAndSettle();

      final checkboxFinder = find.byType(Checkbox);

      // TODO: Assert
      expect(checkboxFinder, findsOneWidget);
      expect(isChecked, isTrue);
    });
  });
}
