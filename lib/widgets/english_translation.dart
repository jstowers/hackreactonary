import 'package:flutter/material.dart';

class EnglishTranslation extends StatelessWidget {

  final String englishTranslation;

  EnglishTranslation(this.englishTranslation);

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    print('screenWidth = $screenWidth');

    if(englishTranslation.isNotEmpty) {
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
                  child: Text('English',
                    style: TextStyle(
                      fontSize: 26.0,
                    )
                  ),
                ),
              ),
              //SizedBox(width: 10.0),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  color: Colors.amber[200],
                  child: Text(englishTranslation,
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        )
                  ),
                ),
              )
            ],
          ),
        )
      );
    }
    return Container();
  }
}