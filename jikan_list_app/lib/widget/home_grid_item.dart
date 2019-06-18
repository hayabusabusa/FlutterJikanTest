import 'package:flutter/material.dart';
import 'package:jikan_list_app/models/animes.dart';
import 'package:jikan_list_app/screens/anime_detail.dart';

class HomeGridItem extends StatelessWidget {
  Anime _anime;

  HomeGridItem(
    this._anime
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return AnimeDetail(_anime);
            }
          )
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_anime.imageUrl)
                )
              ),
            ),
          ),
          Text(
            _anime.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}