import 'package:flutter/material.dart';
import 'package:movie_app/styles/decotations.dart';
import 'package:movie_app/styles/text.dart';
import 'package:movie_app/widgets/text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        decoration: Decorations.backgroundGradiant,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(child: Text('Berenberg Movies', style: TextStyles.header)),
              Container(height: 100, margin: EdgeInsets.all(15.0), child: AppTextField()),
            ],
          ),
        ),
      ),
    );
  }
}
