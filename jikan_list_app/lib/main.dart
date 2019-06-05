import 'package:flutter/material.dart';
import 'package:jikan_list_app/screens/home.dart';

void main() {
  runApp(JikanListApp());
} 

class JikanListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jikan list",
      home: Home(),
    );
  }
}