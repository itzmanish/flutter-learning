import 'package:first/model/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCastDetails extends StatelessWidget {
  final Movie movie;

  const MovieCastDetails({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          MovieCast(field: "Actors", value: movie.actors),
          MovieCast(field: "Director", value: movie.director),
          MovieCast(field: "Writer", value: movie.writer),
          MovieCast(field: "Awards", value: movie.awards),
          MovieCast(field: "Language", value: movie.language),
          MovieCast(field: "Country", value: movie.country),
        ],
      ),
    );
  }
}

class MovieCast extends StatelessWidget {
  final String field, value;

  const MovieCast({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$field : ",
            style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
