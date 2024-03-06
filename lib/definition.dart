class Definition {
  final String word;
  final String phonetic;
  final Meaning meanings;

  Definition(
      {required this.word, required this.phonetic, required this.meanings});

  factory Definition.fromJson(Map<String, dynamic> json) {
    // final Meaning meaning = json["meanings"] != null
    //     ? Meaning.fromJson(json["meanings"])
    //     : Meaning(partOfSpeech: '', definitions: []);
    final Meaning meaning = Meaning.fromJson(json["meanings"][0]);

    return Definition(
      word: json["word"],
      phonetic: json["phonetic"] ?? "",
      meanings: meaning,
    );
  }
}

class Meaning {
  final String partOfSpeech;
  final List<DefinitionItem> definitions;

  Meaning({required this.partOfSpeech, required this.definitions});

  factory Meaning.fromJson(Map<String, dynamic> json) {
    var definitionJSON = json["definitions"] as List;

    List<DefinitionItem> definitionList = definitionJSON.map((definition) {
      return DefinitionItem.fromJson(definition);
    }).toList();

    return Meaning(
        partOfSpeech: json["partOfSpeech"], definitions: definitionList);
  }
}

class DefinitionItem {
  final String definition;

  DefinitionItem({required this.definition});

  factory DefinitionItem.fromJson(Map<String, dynamic> json) {
    return DefinitionItem(definition: json["definition"]);
  }
}
