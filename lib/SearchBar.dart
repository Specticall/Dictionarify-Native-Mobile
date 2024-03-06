import 'package:flutter/material.dart';
import "dart:developer";

typedef THandleChange = void Function(String value);

class SearchBarCustom extends StatefulWidget {
  final THandleChange handleChange;

  const SearchBarCustom({super.key, required this.handleChange});

  @override
  State<SearchBarCustom> createState() => _SearchBarCustomState();
}

class _SearchBarCustomState extends State<SearchBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(100)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 36),
            child: TextField(
              onChanged: widget.handleChange,
              decoration: const InputDecoration(
                hintText: "Search a word",
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
        ));
  }
}
