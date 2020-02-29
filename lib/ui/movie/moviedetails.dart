import 'package:first/model/movie.dart';
import 'package:first/ui/movie/moviecastdetails.dart';
import 'package:first/ui/movie/moviedetailposter.dart';
import 'package:flutter/material.dart';

class MovieListViewDetail extends StatelessWidget {
  final Movie movie;

  const MovieListViewDetail({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moviez"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          movieDetailThumbnail(movie.images[0], context),
          MovieDetailHeaderWithPoster(movie: movie),
          MovieCastDetails(
            movie: movie,
          ),
          MovieDetailsExtraPoster(
            poster: movie.images,
          )
        ],
      ),
    );
  }

  Widget movieDetailThumbnail(String imageUrl, BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            Icon(
              Icons.play_circle_outline,
              size: 90,
              color: Colors.white,
            ),
          ],
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent.withOpacity(0.0), Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
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
