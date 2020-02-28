import 'package:first/model/movie.dart';
import 'package:flutter/material.dart';

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

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${movie.year} . ${movie.genre}".toUpperCase(),
          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w300),
        ),
        Text(
          movie.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        Text.rich(
          TextSpan(
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w300, color: Colors.white),
            children: <TextSpan>[
              TextSpan(text: movie.plot),
              TextSpan(
                text: "More...",
                style: TextStyle(color: Colors.indigoAccent),
              ),
            ],
          ),
        )
      ],
    );
  }
}
