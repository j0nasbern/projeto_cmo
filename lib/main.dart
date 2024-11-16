import 'package:flutter/material.dart';
import '/data/data_storage.dart';
import 'screens/homepage/homepage_screen.dart';

void main() {
  runApp(MyApp());
}

// App starts at Homepage and create a datastorage instance
class MyApp extends StatelessWidget {
  final DataStorage _dataStorage = DataStorage(<String>[]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomepageScreen(_dataStorage),
    );
  }
}