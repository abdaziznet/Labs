import 'package:flutter/material.dart';

import 'custom_progress.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Progress Bar'),
        ),
        body: Center(
          child: CustomProgressBar(200),
        ),
      ),
    );
  }
}
