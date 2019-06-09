import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jikan_list_app/models/animes.dart';
import 'package:jikan_list_app/widget/home_grid_item.dart';

class Home extends StatefulWidget {
  State createState() => HomeState();
}

class HomeState extends State<Home> {
  Animes _animes;

  Future _fetchAnimes() async {
    var response = await http.get('https://api.jikan.moe/v3/season/2019/summer');

    if (response.statusCode == 200) {
      var persedAnimes = Animes.fromJson(json.decode(response.body));
      setState(() {
        _animes = persedAnimes;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAnimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: _animes == null 
      ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
        ),
      )
      : GridView.count(
          crossAxisCount: 3,
          children: List.generate(_animes.anime.length, (index) {
            return HomeGridItem(_animes.anime[index]);
          }),
        ),
    );
  }
}