import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 100),
        Text(
          "Dictionarify",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Text(
            "Your one-stop solution for word meanings and synonyms in the English language.",
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 24)
      ],
    );
  }
}
