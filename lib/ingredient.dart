import 'package:flutter/material.dart';
import 'package:xtivia_flutter_recipes/model/ingredient_model.dart';

typedef OnDelete();

class Ingredient extends StatefulWidget {
  final IngredientModel ingredientModel;
  final OnDelete onDelete;
  @override
  _IngredientState createState() => _IngredientState();
  Ingredient({Key key, this.ingredientModel, this.onDelete}) : super(key: key);
}

class _IngredientState extends State<Ingredient> {
  TextEditingController _name;
  TextEditingController _qty;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.ingredientModel.name);
    _qty = TextEditingController(text: widget.ingredientModel.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              onChanged: (val) => widget.ingredientModel.name = val,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Name",
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _qty,
              onChanged: (val) => widget.ingredientModel.quantity = val,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "Quantity",
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: widget.onDelete,
            child: new Icon(
              IconData(0xe92b, fontFamily: 'MaterialIcons'),
            ),
          ),
        ),
      ],
    );
  }
}
