
class SpanishVerbs {
  final int id;
  final String verb;
  final List<String> translations;

  SpanishVerbs(
    this.id,
    this.verb,
    this.translations,
  );

  // creates a new SpanishVerbs instance from a map structure
  SpanishVerbs.fromMappedJson(Map<String,dynamic> json)
    : id = json['id'],
      verb = json['word'],
      translations = json['translations'];
}