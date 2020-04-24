import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Model.dart';

Future<List<Users>> getData() async {
  final response = await http.get('http://192.168.1.13/cleanpoint/index.php');
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Users>((i) => Users.fromJson(i)).toList();
  } else {
    throw Exception('asd');
  }
}

Future<List<Users>> getItem() async {
  final response = await http.get('http://192.168.1.13/cleanpoint/index.php');
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Users>((i) => Users.fromJson(i)).toList();
  } else {
    throw Exception('asd');
  }
}
