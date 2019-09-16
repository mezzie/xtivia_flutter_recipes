import 'package:flutter/material.dart';
import 'package:xtivia_flutter_recipes/model/recipe_model.dart';
import 'package:xtivia_flutter_recipes/service/recipe_service.dart';

class NewRecipe extends StatefulWidget {
  @override
  _NewRecipeState createState() => _NewRecipeState();
}

class _NewRecipeState extends State<NewRecipe> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Recipe"),
      ),
      body: Container(
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
      recipe.title = title.text;
      RecipeService.instance.addRecipe(recipe);
      Navigator.pop(context, false);
    }
  }
}
