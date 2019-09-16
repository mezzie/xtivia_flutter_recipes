import 'package:xtivia_flutter_recipes/model/recipe_model.dart';

abstract class BaseRecipeService {
  List<RecipeModel> getRecipes();
  void addRecipe(RecipeModel recipe);
}

class RecipeService implements BaseRecipeService {

  // Make class singleton
  RecipeService._privateConstructor();

  static final RecipeService _instance =
      new RecipeService._privateConstructor();

  static RecipeService get instance {
    return _instance;
  }

  List<RecipeModel> recipes = new List();

  @override
  List<RecipeModel> getRecipes() {
    return recipes;
  }

  @override
  void addRecipe(RecipeModel recipe) {
    print("saving recipe: " + recipe.title);
    recipes.add(recipe);
  }

}