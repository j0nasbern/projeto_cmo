import 'package:flutter/material.dart';
import '/data/data_storage.dart';

class ShopList extends StatelessWidget {
  DataStorage dataStorage;

  ShopList(this.dataStorage);

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