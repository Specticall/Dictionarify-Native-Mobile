import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:timer_app/definition.dart';
import 'package:timer_app/main.dart';

class Content extends StatefulWidget {
  final Definition? definition;
  final bool definitionExist;
  final bool isLoading;
  const Content(
      {super.key,
      required this.definition,
      required this.definitionExist,
      required this.isLoading});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool definitionExist = false;

  @override
  void didUpdateWidget(covariant Content oldWidget) {
    // print(widget.definition!.meanings.definitions);
    // for (final definition in widget.definition!.meanings.definitions) {
    //   print(definition.definition);
    // }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: widget.isLoading
              ? const [Text("Loading...")]
              : widget.definitionExist
                  ? [
                      Text(widget.definition!.word,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(widget.definition!.phonetic),
                      const SizedBox(
                        height: 20,
                      ),
                      DefintionList(
                          definitionList:
                              widget.definition!.meanings.definitions)
                    ]
                  : const [
                      Text(
                        "Uh Oh!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Center(
                          child: Text(
                        "The word you searched was not not found in the dictionary, try again with a different word",
                        textAlign: TextAlign.center,
                      )),
                    ],
        ));
  }
}
