import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    // method provided by State that takes a function that changes property of code
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = const [
      {
        'questionText': 'Pick a color',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'Pick an animal',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who is your favorite person?',
        'answers': ['Daph', 'Daph', 'Daph', 'Daph'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            // spread operator takes a list and pulls all values inside so we don't have a list within a list, but values within a list (not nested list)
            // tell dart answers is a list of strings
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
