import 'package:flutter/material.dart';

import 'package:hackreactonary/models/spanish_dictionary.dart';
import 'package:hackreactonary/models/word.dart';
import 'package:hackreactonary/widgets/translation.dart';

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
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text('Translate Spanish',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Ready to learn . . .',
                ),
                style: TextStyle(fontSize: 24.0),
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
                      fontSize: 24.0,
                    )
                  )
                )
              ),
              SizedBox(height: 20.0),
              Container(
                child: Column(
                  children: <Widget>[
                    Translation(_englishTranslation, Language.english),
                    SizedBox(height: 20.0),
                    Translation(_frenchTranslation, Language.french),
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
        _frenchTranslation = '';
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
          _frenchTranslation = dictionary.translate(_spanishWord, Language.french);
        });
      } else {
        setState(() {
          _englishTranslation = '';
          _frenchTranslation = '';
        });
      } 
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
