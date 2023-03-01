import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movie_details_page.dart';
import 'package:movie_app/styles/decotations.dart';
import 'package:movie_app/styles/text.dart';

class MoviesPage extends StatelessWidget {
  final List<Movie> movies;
  MoviesPage({this.movies});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: Decorations.backgroundGradiant,
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(top: height * 0.05),
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final x = movies[index];
              if (x.image == null || x.image == 'N/A') {
                return Container();
              } else {
                return Container(
                  padding: EdgeInsets.only(left: 10.0, right: 5.0, bottom: 5.0, top: 5.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      hoverColor: Colors.grey,
                      highlightColor: Colors.grey,
                      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => MovieDetails(movie: x))),
                      child: Row(
                        children: [
                          Container(height: height * 0.2, width: width * 0.3, child: Image.network(x.image, fit: BoxFit.cover)),
                          SizedBox(width: width * 0.02),
                          Expanded(child: Container(child: Text(x.name, style: TextStyles.movieTitle))),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
