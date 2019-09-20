import 'package:flutter/material.dart';
import 'package:xtivia_flutter_recipes/ingredient.dart';
import 'package:xtivia_flutter_recipes/model/ingredient_model.dart';
import 'package:xtivia_flutter_recipes/model/recipe_model.dart';
import 'package:xtivia_flutter_recipes/service/recipe_service.dart';

class NewRecipe extends StatefulWidget {
  final BaseRecipeService recipeService;

  NewRecipe({Key key, this.recipeService}) : super(key: key);
  @override
  _NewRecipeState createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();
  List<Ingredient> ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Recipe"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: title,
                validator: (val) {
                  if (val.isEmpty) return "Title can't be empty";
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Something yummy",
                  labelText: "Title",
                ),
              ),
              RaisedButton(
                child: Text("Add Ingredient"),
                onPressed: addIngredient,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  itemBuilder: (_, i) => ingredients[i]),
              RaisedButton(
                child: Text("Save"),
                onPressed: addRecipe,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addRecipe() {
    if (_formKey.currentState.validate()) {
      RecipeModel recipe = RecipeModel();
      recipe.ingredients = [];
      recipe.title = title.text;
      ingredients.forEach((ingredient) => {
        recipe.ingredients.add(ingredient.ingredientModel)
      });
      widget.recipeService.addRecipe(recipe);
      Navigator.pop(context, false);
    }
  }

  void addIngredient() {
    setState(() {
     IngredientModel ingredientModel = IngredientModel();
     ingredients.add(Ingredient(
       key: UniqueKey(),
       ingredientModel: ingredientModel,
       onDelete: () => deleteIngredient(ingredientModel)
     ));
    });
  }

  void deleteIngredient(IngredientModel ingredientModel){
    if (ingredients.length > 0) {
      setState(() {
        var find = ingredients.firstWhere(
          (it) => it.ingredientModel == ingredientModel,
          orElse: () => null,
        );
        if (find != null) ingredients.removeAt(ingredients.indexOf(find));
      });
    }
  }
}
