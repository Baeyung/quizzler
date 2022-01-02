import 'package:flutter/material.dart';
import './qandaholder.dart';

QAndAHolder _qAndAHolder = QAndAHolder();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quizzler App'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MainScreen(),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Icon tick() {
    return const Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Icon cross() {
    return const Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  List<Icon> stats = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                _qAndAHolder.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: _qAndAHolder.allowMove()
                    ? MaterialStateProperty.all<Color>(Colors.green)
                    : MaterialStateProperty.all<Color>(Colors.grey),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: _qAndAHolder.allowMove()
                  ? () {
                      setState(() {
                        _qAndAHolder.getAnswer()
                            ? stats.add(tick())
                            : stats.add(cross());
                        if (_qAndAHolder.getAnswer() == true) {
                          _qAndAHolder.setCorrect();
                        }
                        if (_qAndAHolder.nextQuestion(context)) {
                          stats.clear();
                        }
                      });
                    }
                  : null,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: _qAndAHolder.allowMove()
                    ? MaterialStateProperty.all<Color>(Colors.red)
                    : MaterialStateProperty.all<Color>(Colors.grey),
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: _qAndAHolder.allowMove()
                  ? () {
                      setState(() {
                        !_qAndAHolder.getAnswer()
                            ? stats.add(tick())
                            : stats.add(cross());
                        if (_qAndAHolder.getAnswer() == false) {
                          _qAndAHolder.setCorrect();
                        }
                        if (_qAndAHolder.nextQuestion(context)) {
                          stats.clear();
                        }
                      });
                    }
                  : null,
            ),
          ),
        ),
        Row(children: stats)
      ],
    );
  }
}
