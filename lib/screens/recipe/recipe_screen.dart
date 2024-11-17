import 'package:flutter/material.dart';
import '/data/data_storage.dart';

// <<NÃO IMPLEMENTADO>>
// Class RecipeScreen
//
// Contém o ecrã onde serão exibidas as receitas e toda a
// informação relativa a estas.
class RecipeScreen extends StatelessWidget {
  DataStorage dataStorage;

  RecipeScreen(this.dataStorage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back)),
        title: const Text('Recipes'),
        backgroundColor: Colors.grey.shade400,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey.shade400,
        child: const Icon(Icons.add),
      )
    );
  }
}