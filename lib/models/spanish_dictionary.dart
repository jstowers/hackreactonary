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
    'engañar': Word(
      Language.spanish,
      PartsSpeech.verb,
      {
        Language.english: 'to deceive',
        Language.french: 'tromper',
      }
    ),
    'aullar': Word(
      Language.spanish,
      PartsSpeech.verb,
      {
        Language.english: 'to howl',
        Language.french: 'hurler',
      }
    )
  };
  
  // translate spanish to english or french
  String translate(String word, Language language) {
    if(isWordDefined(word, language)) {
      return dictionary[word].translations[language];
    }
    return 'word not found';
  }
  
  // is word in dictionary
  bool isWordDefined(String word, Language language) {
    return dictionary[word] != null && dictionary[word].translations[language].isNotEmpty;
  }
}