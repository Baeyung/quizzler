import 'package:flutter/cupertino.dart';

import './qanda.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QAndAHolder {
  late int _index, _correct;
  late bool _allowmove;
  QAndAHolder() {
    _index = _correct = 0;
    _allowmove = true;
  }
  final List<QAndA> _qAndA = [
    QAndA(
      'Some cats are actually allergic to humans',
      true,
    ),
    QAndA(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    QAndA(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    QAndA(
      'A slug\'s blood is green.',
      true,
    ),
    QAndA(
      'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
      true,
    ),
    QAndA(
      'It is illegal to pee in the Ocean in Portugal.',
      true,
    ),
    QAndA(
      'No piece of square dry paper can be folded in half more than 7 times.',
      false,
    ),
    QAndA(
      'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      true,
    ),
    QAndA(
      'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      false,
    ),
    QAndA(
      'The total surface area of two human lungs is approximately 70 square metres.',
      true,
    ),
    QAndA('Google was originally called "Backrub".', true),
    QAndA(
      'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      true,
    ),
    QAndA(
      'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      true,
    ),
  ];

  String getQuestion() {
    return _qAndA[_index].question;
  }

  bool getAnswer() {
    return _qAndA[_index].answer;
  }

  int returnLength() {
    return _qAndA.length;
  }

  bool nextQuestion(BuildContext context) {
    _index < _qAndA.length - 1 ? _index++ : _allowmove = false;
    if (!_allowmove) {
      reset(context);
      return true;
    } else {
      return false;
    }
  }

  bool allowMove() {
    return _allowmove;
  }

  void setCorrect() {
    _correct++;
  }

  void reset(BuildContext context) {
    Alert(
      context: context,
      title: 'The Quiz is Finished and your score is $_correct/13',
      desc: 'press cancel to restart',
    ).show();
    _correct = 0;
    _allowmove = true;
    _index = 0;
  }
}
