import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan Row dan Column"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Column 1"),
            Text("Column 2"),
            Text("Column 3"),
            Text("\n"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Row 1"), Text("Row 2"), Text("Row 3")],
            )
          ],
        ),
      ),
    );
  }
}
