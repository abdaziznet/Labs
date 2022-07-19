import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabBar myTabBar = TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.comment),
          text: "Comment",
        ),
        Tab(
          child: Image(
            image: AssetImage("assets/mountain.png"),
          ),
        ),
        Tab(
          icon: Icon(Icons.train),
        ),
        Tab(
          text: "News",
        )
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Contoh Tab Bar"),
            bottom: myTabBar,
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("Tab satu"),
              ),
              Center(
                child: Text("Tab dua"),
              ),
              Center(
                child: Text("Tab tiga"),
              ),
              Center(
                child: Text("Tab empat"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
