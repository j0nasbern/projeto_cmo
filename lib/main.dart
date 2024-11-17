import 'package:flutter/material.dart';
import 'data/ingredient.dart';
import 'data/data_storage.dart';
import 'data/recipe.dart';
import 'screens/homepage/homepage_screen.dart';

void main() {
  runApp(MyApp());
}

// Classe main da app
//
// Cria uma instância de DataStorage que contém
// todas as listas de dados para a sessão.Cria também
// um screen Homepage ao qual passa a instância
// DataStorage.
class MyApp extends StatelessWidget {
  final DataStorage _dataStorage = DataStorage(<Ingredient>[], <Recipe>[]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomepageScreen(_dataStorage),
    );
  }
}