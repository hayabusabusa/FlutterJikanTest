import 'package:flutter/material.dart';
import 'package:jikan_list_sample/model/anime.dart';

class AnimeDetail extends StatelessWidget {
  Anime anime;

  AnimeDetail(
    this.anime
  );

  Widget _buildContentWidget(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title),
            Divider(color: Colors.grey[350],),
            Text(content),
          ],
        ),
      ),
    );
  }

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
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  _buildContentWidget("Anime title", anime.title),
                  _buildContentWidget("Anime description", "This widget shows anime description."),
                  _buildContentWidget("Anime tag", "Tag is here ?")
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}