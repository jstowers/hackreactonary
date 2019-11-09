
import 'package:hackreactonary/models/word.dart';

class SpanishDictionary {
  
  Map<String,Word> dictionary = {
    'ayunar': Word(
        Language.spanish,
        PartsSpeech.verb,
        {
          Language.english: 'to fast',
          Language.french: 'jeûner'
        }
    ),  
    'volver': Word(
        Language.spanish,
        PartsSpeech.verb,
        {
          Language.english: 'to return',
          Language.french: 'revenir',
        }
    ),
  };
  
  // method to translate a word
  // if given a word in english or french, translate to spanish
  String translate(String word, Language language) {
    if(isWordDefined(word, language)) {
      return dictionary[word].translations[language];
    }
    return 'word not found';
  }
  
  
  // does word exist in dictionary
  bool isWordDefined(String word, Language language) {
    if( dictionary[word] != null && dictionary[word].translations[language].isNotEmpty) {
      return true;
    }
    return false;
  }
}