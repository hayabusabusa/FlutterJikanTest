import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jikan_list_sample/model/genre.dart';

class AnimeListGenreTag extends StatelessWidget {
  List<Genre> genres;

  AnimeListGenreTag(this.genres);

  List<Widget> _buildGenreWidgets() {
    var widgets = genres.take(3).map((it) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        color: Colors.blue,
        child: Text(it.name, style: TextStyle(fontSize: 11.0, color: Colors.white)),
      );
    });
    return widgets.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      children: _buildGenreWidgets(),
    );
  } 
}