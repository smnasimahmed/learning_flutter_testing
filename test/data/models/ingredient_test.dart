import 'package:flutter_test/flutter_test.dart';
import 'package:recipes/data/models/models.dart';

void main() {
  group('Ingredient Test', () {
    test('Can instantiate', () {
      // Arrenge
      late Ingredient ingredient;

      //Act
      ingredient = const Ingredient();

      // Assert
      expect(ingredient, isNotNull);
    });

    test('can set default properties', () {
      late Ingredient ingredient;

      ingredient = const Ingredient();

      expect(ingredient.id, isNull);
      expect(ingredient.recipeId, isNull);
      expect(ingredient.name, isNull);
      expect(ingredient.amount, isNull);
    });

    test('can receive parameters', () {
      // Arrange
      late Ingredient ingredient;

      const id = 123;
      const recipeId = 54321;
      const name = 'Parmesan Cheese';
      const amount = 1.0;

      // Act
      ingredient = const Ingredient(
        id: id,
        recipeId: recipeId,
        name: name,
        amount: amount,
      );

      // Assert
      expect(ingredient.id, equals(id));
      expect(ingredient.recipeId, equals(recipeId));
      expect(ingredient.name, equals(name));
      expect(ingredient.amount, equals(amount));
    });

    test('can instantiate from JSON', () {
      late Ingredient ingredient;

      final jsonMap = <String, dynamic>{
        'id': 123,
        'recipeId': 54321,
        'name': 'Parmesan Cheese',
        'weight': 50.0,
        'amount': 1,
      };

      const id = 123;
      const recipeId = 54321;
      const name = 'Parmesan Cheese';
      const amount = 1.0;

      ingredient = Ingredient.fromJson(jsonMap);

      expect(ingredient.id, equals(id));
      expect(ingredient.recipeId, equals(recipeId));
      expect(ingredient.name, equals(name));
      expect(ingredient.amount, equals(amount));
    });
  });
}
