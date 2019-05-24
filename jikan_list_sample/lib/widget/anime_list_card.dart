import 'package:flutter/material.dart';
import 'package:jikan_list_sample/model/anime.dart';

class AnimeListCard extends StatelessWidget {
  final Anime anime;

  AnimeListCard(
    this.anime
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Image.network(
              anime.image,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(anime.title),
                  Text(anime.type)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}