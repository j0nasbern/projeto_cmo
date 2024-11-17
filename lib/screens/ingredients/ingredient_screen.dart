import 'package:flutter/material.dart';
import '/data/ingredient.dart';
import '/data/data_storage.dart';
import '/screens/ingredients/ingredient_form.dart';

// Classe IngredientScreenState
//
// Estado de IngredientsScreen. Requer uma instância do
// IngredientsScreen para guardar a lista na instância
// DataStorage que foi passada. Sempre que é criado um
// ecrã IngredientForm, é utilizado o comando .then() para
// realizar uma função ao voltar para este ecrã. Em ambas
// as utilizações do setState é chamada a função saveList
// para guardar as alterações feitas no IngredientForm.
class IngredientsScreenState extends State<IngredientsScreen> {
  List<Ingredient> _ingredientList;
  final IngredientsScreen _ingredientsScreen;

  IngredientsScreenState(this._ingredientsScreen, this._ingredientList);

// Função createButtonList
//
// Cria a lista de ingredientes existentes a apresentar.
// Cada elemento contém o nome do ingrediente e dois
// botões - um para modificar o ingrediente e outro para
// eliminar o ingrediente.
  List<ListTile> createButtonList(List<Ingredient> ingredientList) {
    List<ListTile> buttonList = <ListTile>[];
    for (int i = 0; i < _ingredientList.length; i++) {
      buttonList.add(
        ListTile(
          title: Text(_ingredientList[i].getName()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IngredientForm(this, false, _ingredientList[i].getName()))
                  ).then((_) {
                    setState(() {
                      _ingredientsScreen.saveList(_ingredientList);
                    });
                  });
                  
                },
                child: const Icon(Icons.edit)
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _ingredientList.removeAt(i);
                  });
                },
                child: const Icon(Icons.delete)
              ),
            ],
          )
        )
      );
    }
    return buttonList;
  }

  List<Ingredient> getIngredientList() {
    return _ingredientList;
  }

  void setIngredientList(List<Ingredient> newList) {
    _ingredientList = newList;
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
        title: const Text('Ingredients'),
        backgroundColor: Colors.grey.shade400,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
// Cria a lista de botões através da função
// createButtonList.
        children: createButtonList(_ingredientList),
      ),
// FloatingActionButton que permite adicionar um novo
// ingrediente.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => IngredientForm(this, true))
          ).then((_) {
            setState(() {
              _ingredientsScreen.saveList(_ingredientList);
            });
          });
        },
        backgroundColor: Colors.grey.shade400,
        child: const Icon(Icons.add),
      )
    );
  }
}

// Classe IngredientsScreen
//
// Cria uma lista local de ingredientes a partir da lista
// de ingredientes da instância DataStorage. Utiliza um
// estado para permitir interação visual devido ao método
// CRUD.
class IngredientsScreen extends StatefulWidget {
  final DataStorage _dataStorage;
  List<Ingredient>? _ingredientList;
  
  IngredientsScreen(this._dataStorage) {
    _ingredientList = _dataStorage.getIngredientList();
  }

// Função saveList
//
// Permite guardar a lista local de ingredientes na
// lista da instância DataStorage fazendo com que esta
// seja mantida durante toda a sessão, mesmo quando um
// novo IngredientsScreen é criado.
  void saveList(List<Ingredient> newList) {
    _dataStorage.setIngredientList(newList);
  }

  @override
  State<IngredientsScreen> createState() => IngredientsScreenState(this, _ingredientList!);
}