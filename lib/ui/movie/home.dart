import 'package:first/model/movie.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movies = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moviez"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return movieCard(movies[index], context);
            // return Card(
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(50),
            //           image: DecorationImage(
            //             image: NetworkImage(movies[index].images[0]),
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //         child: null,
            //       ),
            //     ),
            //     title: Text(movies[index].title),
            //     subtitle: Text(movies[index].genre),
            //     trailing: Text(movies[index].imdbRating),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => MovieListViewDetail(
            //                     movieName: movies.elementAt(index).title,
            //                   )));
            //     },
            //     // onTap: () => debugPrint("${movies.elementAt(index)}"),
            //   ),
            //   color: Colors.white,
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Stack(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 70.0,
                  right: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text("Rating: ${movie.imdbRating} / 10"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Genre: ${movie.genre}",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Released: ${movie.released}"),
                        Text("Runtime: ${movie.runtime}"),
                        Text("${movie.rated}"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 30.0,
              left: 10.0,
              child: movieAvatar(movie.images[0]),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieListViewDetail(
              movie: movie,
            ),
          ),
        );
      },
    );
  }

  Widget movieAvatar(String imageUrl) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? "https://picsum.photos/100"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MovieListViewDetail extends StatelessWidget {
  final Movie movie;

  const MovieListViewDetail({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Go Back",
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
