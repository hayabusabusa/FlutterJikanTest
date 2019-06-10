import 'package:flutter/material.dart';
import 'package:jikan_list_app/models/animes.dart';

class HomeGridItem extends StatelessWidget {
  Anime _anime;

  HomeGridItem(
    this._anime
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
          ),
        ],
      ),
    );
  }
}