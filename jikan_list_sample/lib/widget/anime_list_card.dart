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
      child: SizedBox(
        height: 260,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(anime.image),//Image.network(anime.image),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(anime.title),
                      Text(anime.type),
                      Text(anime.allGenreString(), style: TextStyle(fontSize: 11.0))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}