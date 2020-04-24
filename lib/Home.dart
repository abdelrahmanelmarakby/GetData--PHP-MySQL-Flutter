import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController email = TextEditingController();
login(BuildContext context) async {
  List data = await loginn(username.text, password.text, email.text);
  print(data);

  if (data.length != 0) {
  } else {
    print("false");
  }
}

Future loginn(String un, String pass, String email) async {
  String url = "http://192.168.1.13/cleanpoint/insert.php";
  http.Response response = await http
      .post(url, body: {'name': un, 'password': pass, "email": email});
  print(response.statusCode);
  if (response.statusCode == 200) {
    return json.encode(response.body);
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                  ),
                  fillColor: Colors.red,
                  filled: true,
                  hintText: ("Name"),
                  hintStyle: TextStyle(color: Colors.white)),
              style: TextStyle(),
              controller: username,
            ),
            TextField(
              controller: email,
            ),
            TextField(
              controller: password,
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () async {
                login(context);
                Navigator.pushNamed(context, 'second');
              },
              child: Text('insert'),
            ),
          ],
        ),
      ),
    );
  }
}
