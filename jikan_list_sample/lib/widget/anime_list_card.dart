import 'package:flutter/material.dart';
import 'package:jikan_list_sample/model/anime.dart';
import 'package:jikan_list_sample/screens/anime_detail.dart';
import 'package:jikan_list_sample/widget/anime_list_genre_tag.dart';

class AnimeListCard extends StatelessWidget {
  final Anime anime;

  AnimeListCard(
    this.anime
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var router = new MaterialPageRoute(builder: (BuildContext context) {
          return AnimeDetail(anime);
        });
        Navigator.of(context).push(router);
      },
      child: SizedBox(
        height: 230,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
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
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(anime.title, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(anime.type),
                      AnimeListGenreTag(anime.genres),
                      //Text(anime.allGenreString(), style: TextStyle(fontSize: 11.0))
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