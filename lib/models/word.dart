
// enumerated values => named constant values
enum PartsSpeech{noun, verb, adjective}

enum Language{english, spanish, french}

// Word data model
class Word {
  Language language;
  PartsSpeech type;
  Map<Language, String> translations;
  
  Word(this.language, this.type, this.translations);
}

abstract class LanguageUtils {

  static final Map<Language,String> lookup = {
    Language.english: "English",
    Language.french: "French",
    Language.spanish: "Spanish",
  };
}