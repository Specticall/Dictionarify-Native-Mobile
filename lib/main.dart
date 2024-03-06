import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timer_app/Heading.dart';
import 'package:timer_app/SearchBar.dart';
import 'package:http/http.dart' as http;
import 'package:timer_app/content.dart';
import 'package:timer_app/definition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  String searchValue = "";
  bool definitionExist = false;
  bool isLoading = false;

  Definition? definition;

  Future<Definition> fetchWordDefinition(String word) async {
    if (word == "") throw Exception("Word can't be empty");
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
        Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/$word"));

    if (response.statusCode != 200) {
      setState(() {
        definitionExist = false;
      });
      throw Exception("Failed to fetch word definition");
    }

    final List itemList = jsonDecode(response.body) as List;

    final Map<String, dynamic> item = itemList[0];

    final Definition decoded = Definition.fromJson(item);

    setState(() {
      definition = decoded;
      definitionExist = true;
    });

    return decoded;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(226, 232, 243, 1),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
              child: Column(
            children: [
              const Heading(),
              SearchBarCustom(handleChange: (value) {
                setState(() {
                  searchValue = value;
                });
              }),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    fetchWordDefinition(searchValue);
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text("Find Definition")),
              const SizedBox(height: 20),
              Content(
                definition: definition,
                definitionExist: definitionExist,
                isLoading: isLoading,
              ),
              const SizedBox(height: 20)
            ],
          )),
        ));
  }
}

class DefintionList extends StatefulWidget {
  final List<DefinitionItem> definitionList;

  const DefintionList({super.key, required this.definitionList});

  @override
  State<DefintionList> createState() => _DefintionListState();
}

class _DefintionListState extends State<DefintionList> {
  @override
  void didUpdateWidget(covariant DefintionList oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.definitionList.length,
      itemBuilder: (context, index) {
        final definition = widget.definitionList[index];
        return Text(
            '${index + 1}. ${definition.definition}'); // Center each item
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
            height: 15); // Change this value to adjust the gap
      },
    );
  }
}
