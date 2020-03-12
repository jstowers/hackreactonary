// enumerated values => named constant values
enum PartsSpeech { noun, verb, adjective }

enum Language { english, spanish, french }

extension LanguageExtension on Language {
  static String _stringValue(Language language) {
    switch (language) {
      case Language.english:
        return 'English';
      case Language.spanish:
        return 'Spanish';
      case Language.french:
        return 'French';
    }
    return '';
  }

  String get value => _stringValue(this);
}

abstract class LanguageUtils {
  static final Map<Language, String> lookup = {
    Language.english: "English",
    Language.french: "French",
    Language.spanish: "Spanish",
  };
}

// Word data model
class Word {
  Language language;
  PartsSpeech type;
  Map<Language, String> translations;

  Word(this.language, this.type, this.translations);
}
