import 'package:flutter/material.dart';
import 'package:xtivia_flutter_recipes/new_recipe.dart';
import 'package:xtivia_flutter_recipes/service/recipe_service.dart';

class Recipes extends StatefulWidget {
  final RecipeService recipeService;
  const Recipes({Key key, this.recipeService}) : super(key: key);
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
                  MaterialPageRoute(builder: (context) => NewRecipe(recipeService: RecipeService.instance)),
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

  Widget getRecipes() {
    if (widget.recipeService.getRecipes().length == 0) {
      return Center(
        child: Text("No recipes"),
      );
    } else {
      return ListView.separated(
        itemCount: widget.recipeService.getRecipes().length,
        itemBuilder: (_, i) => ListTile(
          title: Text(widget.recipeService.getRecipes()[i].title),
          subtitle: Text(
              (widget.recipeService.getRecipes()[i].ingredients == null
                      ? "0"
                      : widget.recipeService
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
}
