import 'package:flutter/material.dart';
import 'package:latihan_http_request_restapi/post_result_model.dart';
import 'package:latihan_http_request_restapi/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _State();
}

class _State extends State<MyApp> {
  PostResult postResult;
  User user;
  String output = "no data";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("API DEMO"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                  (postResult != null)
                      ? postResult.id +
                          " | " +
                          postResult.name +
                          " | " +
                          postResult.job +
                          " | " +
                          postResult.created
                      : "Data not found.",
                  textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI("https://reqres.in/api/users",
                          "Abdul Aziz", "System Engineer")
                      .then((value) {
                    setState(() {
                      postResult = value;
                    });
                  });
                },
                child: Text("POST"),
              ),
              Text(
                  (user != null)
                      ? user.id +
                          " | " +
                          user.firstName +
                          " | " +
                          user.lastName +
                          " | " +
                          user.avatar
                      : "User not found.",
                  textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () {
                  User.getUser("https://reqres.in/api/users/", "2")
                      .then((value) {
                    setState(() {
                      user = value;
                    });
                  });
                },
                child: Text("GET SINGLE"),
              ),
              Text(output, textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () {
                  User.getUsers("https://reqres.in/api/users?page=", "2")
                      .then((value) {
                    setState(() {
                      output = "";
                      for (int i = 0; i < value.length; i++) {
                        output += value[i].id +
                            " | " +
                            value[i].firstName +
                            " | " +
                            value[i].lastName +
                            " | " +
                            value[i].avatar +
                            "\n";
                      }
                    });
                  });
                },
                child: Text("GET LIST"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
