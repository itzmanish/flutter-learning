import 'package:first/model/movie.dart';
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
