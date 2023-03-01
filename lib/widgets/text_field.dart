import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/movies_page.dart';
import 'package:movie_app/styles/decotations.dart';
import 'package:movie_app/styles/text.dart';
import '../screens/movies_page.dart';

class AppTextField extends StatefulWidget {
  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode _node;
  TextEditingController _controller;

  String searchWord = '';
  bool errorMessage = false;

  @override
  void initState() {
    _node = FocusNode();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 5.0),
            decoration: Decorations.textFieldBox,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(hintText: 'Search Your Movie', hintStyle: TextStyles.hintText),
                    autocorrect: true,
                    autofocus: true,
                    style: TextStyles.normalText,
                    controller: _controller,
                    focusNode: _node,
                    onChanged: (value) {
                      setState(() => searchWord = value.trim());
                      if (value == '') setState(() => errorMessage = false);
                    },
                  ),
                ),
                CupertinoButton(
                  onPressed: () async => await fetchdata(context),
                  child: Container(
                    color: Colors.brown.withOpacity(0.0),
                    child: Container(child: Icon(Icons.search, color: Colors.cyan, size: 30)),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(flex: 1, child: Container(child: Text(errorMessage == true ? 'The movie does not exist.' : '', style: TextStyles.hintText)))
      ],
    );
  }

  Future<void> fetchdata(BuildContext context) async {
    final response = await http.get("https://www.omdbapi.com/?s=$searchWord&apikey=489182a9");
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable listOfMovies = result['Search'];
      if (listOfMovies != null) {
        final movies = listOfMovies.map((e) => Movie.fromJason(e)).toList();
        Navigator.push(context, CupertinoPageRoute(builder: (context) => MoviesPage(movies: movies)));
      } else {
        setState(() => errorMessage = true);
      }
    } else {
      throw Exception('Something went wrong');
    }
  }
}
