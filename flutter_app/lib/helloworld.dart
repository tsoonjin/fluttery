import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


var helloWorld = Scaffold(
  appBar: AppBar(
    title: Text('Welcome to Flutter'),
  ),
  body: Center(
    child: Text(WordPair.random().asPascalCase),
  )
);
