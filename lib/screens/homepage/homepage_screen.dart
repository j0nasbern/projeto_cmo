import 'package:flutter/material.dart';
import 'homepage_button.dart';
import '/data/data_storage.dart';
import '../ingredients/ingredient_screen.dart';
import '../recipe/recipe_screen.dart';
import '../shoplist/shoplist_screen.dart';

// Classe de Homepage da app
//
// Recebe um data storage que envia para todos os próximos
// ecrãs que vão ser abertos. Utiliza um custom widget
// HomepageButton para os butões do menu.
class HomepageScreen extends StatelessWidget {
  final DataStorage _dataStorage;

  HomepageScreen(this._dataStorage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.grey.shade400,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
              width: 150,
            ),
            // <<NÃO IMPLEMENTADO>>
            // HomepageButton('Shopping List', ShopListScreen(_dataStorage)),
            const SizedBox(
              height: 30,
              width: 150,
            ),
            HomepageButton('Ingredients', IngredientsScreen(_dataStorage)),
            const SizedBox(
              height: 30,
              width: 150,
            ),
            // <<NÃO IMPLEMENTADO>>
            // HomepageButton('Recipes', RecipeScreen(_dataStorage))
          ],
        ),
      ),
    );
  }
}