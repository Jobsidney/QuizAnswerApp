import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizbrain = Quizbrain();
void main() {
  return runApp(Quizler());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class Quizler extends StatelessWidget {
  const Quizler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizler'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyApp(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> scoreKeeper = [];

  void answerChecker(bool answerChecked) {

    bool correctAnswer = quizbrain.getAnswer();
    setState(() {
      if (answerChecked == correctAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizbrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              quizbrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: FlatButton(
            textColor: Colors.white54,
            color: Colors.green,
            child: Text(
              'true',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              // bool? correctAnswer= quizbrain.getAnswer();
              // if(correctAnswer==true){
              //   print('user got it right');
              //
              // }else{print('user got it wrong');}
              // setState(() {
              //   scoreKeeper.add(Icon(
              //     Icons.check,
              //     color: Colors.green,
              //   ));
              //   quizbrain.nextQuestion();
              // });
              answerChecker(true);
            },
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FlatButton(
            color: Colors.red,
            onPressed: () {
              // bool? correctAnswer= quizbrain.getAnswer();
              // if(correctAnswer==false){
              //   print('user got it right');
              //
              // }else{print('user got it wrong');}
              // setState(() {
              //   scoreKeeper.add(Icon(
              //     Icons.clear_rounded,
              //     color: Colors.red,
              //   ));
              //   quizbrain.nextQuestion();
              // });
              answerChecker(false);
            },
            child: Text('False'),
          ),
        )),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
