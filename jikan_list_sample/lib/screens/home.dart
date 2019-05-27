import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jikan_list_sample/model/animes.dart';
import 'package:jikan_list_sample/widget/anime_list_card.dart';

class Home extends StatefulWidget {
  @override
  State createState() => new HomeState();
}

class HomeState extends State<Home> {
  Animes _animes;

  // Future
  Future<void> _fetchAnimes() async {
    await Future.sync(() {
      // TODO: dynamic link
      var url = "https://api.jikan.moe/v3/season/2019/summer";

      http.get(url).then((response) {
        var res = json.decode(response.body);
        setState(() {
          _animes = Animes.fromJson(res);
        });
      });
    });
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
        title: Text("Jikan list"),
      ),
      body: _animes == null
      ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
        ),
      )
      : Scrollbar(
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: _animes.items.length ,
          itemBuilder: (BuildContext context, int index) {
            var item = _animes.items[index];
            return AnimeListCard(item);
          },
        ),
      ),
    );
  }
}