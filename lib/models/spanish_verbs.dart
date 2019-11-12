
import 'dart:convert';

import 'package:flutter/services.dart';

class SpanishVerb {
  final int id;
  final String verb;
  final List<dynamic> translations;

  SpanishVerb(
    this.id,
    this.verb,
    this.translations,
  );

  // creates a new SpanishVerbs instance from a map structure
  SpanishVerb.fromMappedJson(Map<String,dynamic> json)
    : id = json['id'],
      verb = json['word'],
      translations = json['translations'].cast<String>();
}


class SpanishVerbsCollection {

  List<SpanishVerb> verbs;

  SpanishVerbsCollection();

  Future loadSpanishVerbs() async {
    String jsonVerbs = await _loadSpanishVerbs();
    final Map<String, dynamic> decodedData = _parseJson(jsonVerbs);
    verbs = fromJsonList(decodedData['verbs']);
  }

  Future<String> _loadSpanishVerbs() async {
    return await rootBundle.loadString('assets/spanish_verbs.json');
  }

  Map<String, dynamic> _parseJson(String jsonString) {
    return jsonDecode(jsonString);
  }

  static List<SpanishVerb> fromJsonList(List<dynamic> json) {
    if (json == null) {
      return [];
    } else if (json.isNotEmpty) {
      return json.map((dynamic jsonObj) {
        return jsonObj is Map<String, dynamic>
          ? SpanishVerb.fromMappedJson(jsonObj)
          : null;
      }).toList()
        ..removeWhere((i) => i == null);
    }
    return [];
  }
}