import 'package:flutter/material.dart';
import 'package:jikan_list_app/models/animes.dart';

class AnimeDetail extends StatelessWidget {
  Anime _anime;

  AnimeDetail(
    this._anime
  );

  Widget _buildHeader() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(_anime.imageUrl)
        )
      ),
    );
  }

  Widget _buildContents() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Title'),
              Container(
                height: 4.0,
                color: Colors.orange,
              ),
              Text(_anime.title, textAlign: TextAlign.start,)
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_anime.title),
      ),
      body: SingleChildScrollView(
        child: Row(
          children: <Widget>[
            _buildHeader(),
            _buildContents(),
          ],
        ),
      ),
    );
  }
}