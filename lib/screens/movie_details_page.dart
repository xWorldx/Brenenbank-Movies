import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/styles/decotations.dart';
import 'package:movie_app/styles/text.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({this.movie});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: Decorations.backgroundGradiant,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: height * 0.6, width: width, child: Image.network(movie.image, fit: BoxFit.cover)),
            SizedBox(height: height * 0.01),
            Container(alignment: Alignment.center, child: Text(movie.name, style: TextStyles.movieDetails, textAlign: TextAlign.center)),
            Container(
              margin: EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.04),
                  Row(children: [Text("Type: ", style: TextStyles.movieDetailsHint), Text(movie.type, style: TextStyles.movieDetails)]),
                  SizedBox(height: height * 0.04),
                  Row(children: [Text("Year: ", style: TextStyles.movieDetailsHint), Text(movie.year, style: TextStyles.movieDetails)]),
                  SizedBox(height: height * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
