import 'package:flutter/material.dart';
import '/data/data_storage.dart';
import '/screens/ingredients/ingredient_form.dart';

class IngredientsScreenState extends State<IngredientsScreen> {
  List<String> _ingredientList;
  IngredientsScreen _ingredientsScreen;

  IngredientsScreenState(this._ingredientsScreen, this._ingredientList);

  // Creating the list of ingredients that is made of the custom widget IngredientButton
  List<ListTile> createButtonList(List<String> ingredientList) {
    List<ListTile> buttonList = <ListTile>[];
    for (int i = 0; i < _ingredientList.length; i++) {
      buttonList.add(
        ListTile(
          title: Text(_ingredientList[i]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IngredientForm(this, false, _ingredientList[i]))
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

  List<String> getIngredientList() {
    return _ingredientList;
  }

  void setIngredientList(List<String> newList) {
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
        children: createButtonList(_ingredientList),
      ),
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

class IngredientsScreen extends StatefulWidget {
  final DataStorage _dataStorage;
  List<String>? _ingredientList;
  
  // Pass the List from the global instance to a more local list to limit the data that is passed
  IngredientsScreen(this._dataStorage) {
    _ingredientList = _dataStorage.getIngredientList();
  }

  void saveList(List<String> newList) {
    _dataStorage.setIngredientList(newList);
  }

  @override
  State<IngredientsScreen> createState() => IngredientsScreenState(this, _ingredientList!);
}