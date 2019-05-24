import 'package:flutter/material.dart';
import 'package:jikan_list_sample/screens/home.dart';

// Apiary: https://jikan.docs.apiary.io/#introduction/information

void main() {
  runApp(JikanListSampleApp());
}

class JikanListSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "jikan_list_sample",
      home: Home(),
    );
  }
}