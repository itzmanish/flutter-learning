import 'package:first/model/movie.dart';
import 'package:flutter/material.dart';

import 'moviedetails.dart';

class MovieDetailHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailHeaderWithPoster({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          MoviePoster(posterUrl: movie.images[0].toString()),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: MovieDetailsHeader(movie: movie),
          )
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String posterUrl;

  const MoviePoster({Key key, this.posterUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: MediaQuery.of(context).size.width / 4.0,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(posterUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class MovieDetailsExtraPoster extends StatelessWidget {
  final List<String> poster;

  const MovieDetailsExtraPoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Text(
            "More posters...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 6,
            ),
            itemCount: poster.length,
            itemBuilder: (context, index) => MoviePoster(
              posterUrl: poster[index],
            ),
          ),
        ),
      ],
    );
  }
}
