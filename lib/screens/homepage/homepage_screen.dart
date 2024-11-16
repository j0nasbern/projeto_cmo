import 'package:flutter/material.dart';
import 'homepage_button.dart';
import '/data/data_storage.dart';
import '../ingredients/ingredient.dart';
import '../recipe.dart';
import '../shoplist.dart';

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
        // Column with the homepage buttons
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
              width: 150,
            ),
            HomepageButton('Shopping List', ShopList(_dataStorage)),
            const SizedBox(
              height: 30,
              width: 150,
            ),
            HomepageButton('Ingredients', IngredientsScreen(_dataStorage)),
            const SizedBox(
              height: 30,
              width: 150,
            ),
            HomepageButton('Recipes', Recipe(_dataStorage))
          ],
        ),
      ),
    );
  }
}