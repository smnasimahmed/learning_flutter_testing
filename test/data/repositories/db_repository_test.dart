import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes/data/models/ingredient.dart';
import 'package:recipes/data/repositories/db_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:recipes/data/database/recipe_db.dart';
import 'db_repository_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RecipeDatabase>(),
  MockSpec<RecipeDao>(),
  MockSpec<IngredientDao>(),
])
void main() {
  final mockDb = MockRecipeDatabase();
  final mockIngredientDao = MockIngredientDao();
  final mockRecipeDao = MockRecipeDao();

  // 2.
  final randomIngredients = [
    const Ingredient(
      id: 1123,
      recipeId: 123,
      name: 'Pasta',
      amount: 1.0,
    ),
    const Ingredient(
      id: 1124,
      recipeId: 123,
      name: 'Garlic',
      amount: 1.0,
    ),
    const Ingredient(
      id: 1125,
      recipeId: 123,
      name: 'Breadcrumbs',
      amount: 5.0,
    ),
  ];

  when(mockDb.ingredientDao).thenReturn(mockIngredientDao);
  when(mockDb.recipeDao).thenReturn(mockRecipeDao);

  group('DBRepository', () {
    test('can instantiate', () {
      late DBRepository dbRepository;

      dbRepository = DBRepository(recipeDatabase: mockDb);

      expect(dbRepository, isNotNull);
      expect(dbRepository.recipeDatabase, isNotNull);
    });
  });

  test('can findAllIngredients', () async {
    // Arrange
    final dBRepository = DBRepository(recipeDatabase: mockDb);

    await dBRepository.init();

    when(mockIngredientDao.findAllIngredients()).thenAnswer((_) async => randomIngredients
        .map((e) => DbIngredientData(id: e.id!, recipeId: e.recipeId!, name: e.name!, amount: e.amount!))
        .toList());

    // Act
    final result = await dBRepository.findAllIngredients();

    // Assert
    verify(mockIngredientDao.findAllIngredients()).called(1);
    expect(result, equals(randomIngredients));
  });
}
