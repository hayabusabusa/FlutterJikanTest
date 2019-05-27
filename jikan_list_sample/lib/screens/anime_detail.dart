import 'package:flutter/material.dart';
import 'package:jikan_list_sample/model/anime.dart';

class AnimeDetail extends StatelessWidget {
  Anime anime;

  AnimeDetail(
    this.anime
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              //title: Text(anime.title),
              background: Image.network(
                anime.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}