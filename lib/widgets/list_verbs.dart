import 'package:flutter/material.dart';
import 'package:hackreactonary/models/spanish_verbs.dart';

class ListVerbs extends StatelessWidget {
  final List<SpanishVerb> verbs;

  ListVerbs(this.verbs);

  @override
  Widget build(BuildContext context) {
    if (verbs.length != null) {
      return Container(
        child: ListView.builder(
          itemCount: verbs.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Text(verbs[index].verb);
          },
        ),
      );
    } else
      return Container();
  }
}
