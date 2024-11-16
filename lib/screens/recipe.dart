import 'package:flutter/material.dart';
import '/data/data_storage.dart';

class Recipe extends StatelessWidget {
  DataStorage dataStorage;

  Recipe(this.dataStorage);

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
      body: Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey.shade400,
        child: const Icon(Icons.add),
      )
    );
  }
}