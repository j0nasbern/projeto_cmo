import 'package:flutter/material.dart';
import '/data/data_storage.dart';

// <<NÃO IMPLEMENTADO>>
// Classe ShopListScreen
//
// Contém o ecrã onde será exibida a lista de compras e
// toda a informação rrelativa à mesma.
class ShopListScreen extends StatelessWidget {
  DataStorage dataStorage;

  ShopListScreen(this.dataStorage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back)),
        title: const Text('Shopping List'),
        backgroundColor: Colors.grey.shade400,
      ),
      body: const Text('Shopping List'),
    );
  }
}