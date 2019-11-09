import 'package:flutter/material.dart';
import 'package:hackreactonary/models/word.dart';

class Translation extends StatelessWidget {

  final String translation;
  final Language language;

  Translation(this.translation, this.language);

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final languageString = LanguageUtils.lookup[language];


    if(translation.isNotEmpty) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(width: 2, color: Colors.blueGrey),
        ),
        elevation: 0,
        child: Container(
          color: Colors.amber[200],
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: screenWidth - 50,
          constraints: BoxConstraints(minHeight: 64.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  color: Colors.amber[200],
                  child: Text(languageString,
                    style: TextStyle(
                      fontSize: 26.0,
                    )
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  color: Colors.amber[200],
                  child: 
                    Text(translation,
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ),
            ],
          ),
        )
      );
    }
    return Container();
  }
}