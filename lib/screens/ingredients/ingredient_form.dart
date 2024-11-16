import 'package:flutter/material.dart';
import 'package:projeto_cmo/screens/ingredients/ingredient.dart';


class _IngredientFormState extends State<IngredientForm> {
  TextEditingController textController = TextEditingController();
  final String _title,_ingredientName;
  List<String> _ingredientList = [];
  IngredientsScreenState _state;

  _IngredientFormState(this._state, this._title, this._ingredientName) {
    _ingredientList = _state.getIngredientList();
    textController = TextEditingController(text: _ingredientName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back)),
        title: Text(_title),
        backgroundColor: Colors.grey.shade400,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Ingredient's name",
              ),
              controller: textController,
            )
          )
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_ingredientName.toLowerCase().compareTo('') == 0) {
            _ingredientList.add(textController.text);
          } else {
            for (int i = 0; i < _ingredientList.length; i++) {
              if (_ingredientList[i].toLowerCase().compareTo(_ingredientName) == 0){
                _ingredientList[i] = textController.text;
              }
            }
          }
          _state.setIngredientList(_ingredientList);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.check),
        ),
    );
  }
}

class IngredientForm extends StatefulWidget {
  final bool _isNew;
  String _title = '';
  final String _ingredientName;
  final IngredientsScreenState _state;


  IngredientForm(this._state, this._isNew, [this._ingredientName = '']) {
    if (_isNew) {
      _title = 'Add Ingredient';
    } else {
      _title = 'Change Ingredient';
    }
  }
  
  @override
  State<IngredientForm> createState() => _IngredientFormState(_state, _title, _ingredientName);
}