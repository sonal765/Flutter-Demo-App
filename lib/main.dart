import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // @override
  // _MyAppState createState() => _MyAppState();
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Cow', 'score': 7},
        {'text': 'Cat', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favourite fruit?',
      'answers': [
        {'text': 'Orange', 'score': 5},
        {'text': 'Apple', 'score': 3},
        {'text': 'Banana', 'score': 2},
        {'text': 'Mango', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  // var dummy = ['Hello'];
  // dummy.add('Sonal');
  // print(dummy);  OUTPUT:[Hello,Sonal]

  // questions = []; this does not work if questions is a const

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Demo App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
        // result should be shown.
      ),
    );
  }
}
