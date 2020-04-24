import 'package:flutter/material.dart';

import 'Model.dart';
import 'Network.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      width: 700,
      child: Scaffold(
          body: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Users> users = snapshot.data;
                  return ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: <Widget>[
                              Text(
                                  'ID: ${users[index].id}           Name : ${users[index].name}    Email:${users[index].email}'),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
