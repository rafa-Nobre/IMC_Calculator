// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.resultText,
    required this.image,
  }) : super(key: key);

  final String resultText;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultado'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: 80,
              width: 80,
            ),
            const SizedBox(height: 16),
            Text(resultText),
          ],
        ),
      ),
    );
  }
}
