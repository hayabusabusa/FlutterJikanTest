import 'package:flutter/material.dart';
import 'package:jikan_list_app/models/animes.dart';

class AnimeDetail extends StatelessWidget {
  Anime _anime;

  AnimeDetail(
    this._anime
  );

  Widget _buildHeader() {
    return Container(
      height: 300,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title
          Text('Title'),
          Divider(color: Colors.grey,),
          Text(_anime.title, textAlign: TextAlign.start,),

          SizedBox(height: 16.0), // Spacer

          // Content
          Text('URL'),
          Divider(color: Colors.grey,),
          Text(_anime.url, textAlign: TextAlign.start,),
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              _buildHeader(),
              _buildContents(),
            ],
          ),
        ),
      ),
    );
  }
}