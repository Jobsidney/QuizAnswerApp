import 'question.dart';
class Quizbrain{
  int _quiznb=0;
  List<Question> _questionBank=[Question(questionText:'You can lead a cow down stairs but not up stairs',questionAnswer: false ),
    Question(questionText: 'Approximately one quarter of human bones are in the feet',questionAnswer: true),
    Question(questionText: 'A slug blood is green',questionAnswer: true)
  ];
  void nextQuestion(){
    if(_quiznb<_questionBank.length -1){
      _quiznb++;
    }
  }
  getQuestionText(){
    return _questionBank[_quiznb].questionText;
  }
  getAnswer(){
    return _questionBank[_quiznb].questionAnswer;
  }
}