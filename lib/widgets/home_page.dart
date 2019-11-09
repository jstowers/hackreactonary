import 'package:flutter/material.dart';
import 'package:hackreactonary/models/spanish_dictionary.dart';
import 'package:hackreactonary/models/word.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _spanishWord = '';
  String _englishTranslation = '';
  String _frenchTranslation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.white
          )
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text('Translate Spanish',
                  style: TextStyle(fontSize: 20.0),
                )
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ready to learn . . .',
                ),
                keyboardType: TextInputType.text,
                validator: _validateInput,
                autovalidate: _autoValidate,
                onChanged: _onInputChange,
                onSaved: (value) => _spanishWord = value,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: RaisedButton(
                  onPressed: _translate,
                  color: Colors.blue,
                  child: Text(
                    'Translate',
                    style: TextStyle(
                      color: Colors.white,
                    )
                  )
                )
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    EnglishTranslation(_englishTranslation),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  String _validateInput(String value) {
    if(value.isEmpty) {
      return 'Enter a word to translate';
    }
    return null;
  }

  void _onInputChange(String value) {
    if(value.isEmpty || value != _spanishWord) {
      setState(() { 
        _englishTranslation = '';
      });
    }
  }

  void _translate() {
    final valid = _formKey.currentState.validate();

    if(valid) {
      _formKey.currentState.save();

      final dictionary = SpanishDictionary();

      if(_spanishWord.isNotEmpty) {
        setState(() {
          _englishTranslation = dictionary.translate(_spanishWord, Language.english);
        });
      } else {
        setState(() {
          _englishTranslation = '';
        });
      } 
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}

class EnglishTranslation extends StatelessWidget {

  final String englishTranslation;

  EnglishTranslation(this.englishTranslation);

  @override
  Widget build(BuildContext context) {
    if(englishTranslation.isNotEmpty) {
      return(
        Row(
          children: <Widget>[
            Text('English'),
            Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
            Text(englishTranslation),
          ],
        )
      );
    }
    return Container();
  }
}
