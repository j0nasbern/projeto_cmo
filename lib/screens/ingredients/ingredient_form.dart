import 'package:flutter/material.dart';
import '/data/ingredient.dart';
import 'ingredient_screen.dart';

// Class _IngredientFormState
//
// Estado do IngredientForm. Recebe a instância do estado
// do IngredientsScreen para utilizar e modificar a lista
// de ingredientes. Utiliza um TextEditingController para
// obter o texto do TextFormField para guardar como nome
// do ingrediente.
class _IngredientFormState extends State<IngredientForm> {
  TextEditingController textController = TextEditingController();
  final String _title,_ingredientName;
  List<Ingredient> _ingredientList = [];
  final IngredientsScreenState _state;

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
// FloatingActionButton para confirmar as mudanças no
// ingrediente. Caso o nome inicial seja '' (espaço em
// branco), significa que está a ser adicionado um
// ingrediente e por isso é adicionado no fim da lista.
// Caso um ingrediente esteja a ser modificado, procura
// na lista o elemento com o mesmo nome do que o nome
// inicial e altera o nome. De seguida atualiza a lista
// do estado do IngredientsScreen.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_ingredientName.toLowerCase().compareTo('') == 0) {
            _ingredientList.add(Ingredient(textController.text));
          } else {
            for (int i = 0; i < _ingredientList.length; i++) {
              if (_ingredientList[i].getName().toLowerCase().compareTo(_ingredientName) == 0){
                _ingredientList[i].setName(textController.text);
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

// Classe IngredientForm
//
// Recebe informações iniciais para definir se está a ser
// criado um ingrediente novo ou se um ingrediente está a
// ser alterado, e cria o estado para o form.
class IngredientForm extends StatefulWidget {
  final bool _isNew;
  String _title = '';
  final String _ingredientName;
  final IngredientsScreenState _state;


  IngredientForm(this._state, this._isNew, [this._ingredientName = '']) {
// Altera o titulo da appBar dependendo de se está a ser
// criado um ingrediente novo ou se está a ser alterado.
    if (_isNew) {
      _title = 'Add Ingredient';
    } else {
      _title = 'Change Ingredient';
    }
  }
  
  @override
  State<IngredientForm> createState() => _IngredientFormState(_state, _title, _ingredientName);
}