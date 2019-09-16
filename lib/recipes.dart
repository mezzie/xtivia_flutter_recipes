import 'package:flutter/material.dart';
import 'package:xtivia_flutter_recipes/new_recipe.dart';
import 'package:xtivia_flutter_recipes/service/recipe_service.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewRecipe()),
                );
              },
              child: Icon(IconData(57669, fontFamily: 'MaterialIcons'),
                  size: 25.0),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(
              child: getRecipes(),
            )
          ],
        ),
      ),
    );
  }
}

Widget getRecipes() {
  if (RecipeService.instance.getRecipes().length == 0) {
    return Center(
      child: Text("No recipes"),
    );
  } else {
    return ListView.separated(
      itemCount: RecipeService.instance.getRecipes().length,
      itemBuilder: (_, i) => ListTile(
        title: Text(RecipeService.instance.getRecipes()[i].title),
        subtitle: Text(
            (RecipeService.instance.getRecipes()[i].ingredients == null
                    ? "0"
                    : RecipeService.instance
                        .getRecipes()[i]
                        .ingredients
                        .length
                        .toString()) +
                " ingredients"),
      ),
      separatorBuilder: (_, i) => Divider(),
    );
  }
}
