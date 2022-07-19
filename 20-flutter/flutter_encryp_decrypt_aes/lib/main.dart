import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'my_encryption.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController tec = TextEditingController();
  var encryptedText, plainText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encrypt / Decrypt"),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: tec,
            ),
          ),
          Column(
            children: [
              Text(
                "PLAIN TEXT",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[400],
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(plainText == null ? "" : plainText),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "ENCRYPTED TEXT",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue[400],
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(encryptedText == null
                    ? ""
                    : encryptedText is encrypt.Encrypted
                        ? encryptedText.base64
                        : encryptedText),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    plainText = tec.text;
                    setState(() {
                      encryptedText =
                          MyEncryptionDecryption.encryptAES(plainText);
                    });
                  });
                  tec.clear();
                },
                child: Text("Encrypt AES"),
              ),
              SizedBox(width: 15),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    encryptedText =
                        MyEncryptionDecryption.decryptAES(encryptedText);
                    print("Type: " + encryptedText.toString());
                  });
                },
                child: Text("Decrypt AES"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    plainText = tec.text;
                    setState(() {
                      encryptedText =
                          MyEncryptionDecryption.encryptFernet(plainText);
                    });
                  });
                  tec.clear();
                },
                child: Text("Encrypt Fernet"),
              ),
              SizedBox(width: 15),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    encryptedText =
                        MyEncryptionDecryption.decryptFernet(encryptedText);
                    print("Type: " + encryptedText.toString());
                  });
                },
                child: Text("Decrypt Fernet"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    plainText = tec.text;
                    setState(() {
                      encryptedText =
                          MyEncryptionDecryption.encryptSalsa20(plainText);
                    });
                  });
                  tec.clear();
                },
                child: Text("Encrypt Salsa20"),
              ),
              SizedBox(width: 15),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    encryptedText =
                        MyEncryptionDecryption.decryptSalsa20(encryptedText);
                    print("Type: " + encryptedText.toString());
                  });
                },
                child: Text("Decrypt Salsa20"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    plainText = tec.text;
                    setState(() {
                      encryptedText = "";
                      plainText = "";
                    });
                  });
                  tec.clear();
                },
                child: Text("Clear All"),
              ),
            ],
          )
        ],
      )),
    );
  }
}
