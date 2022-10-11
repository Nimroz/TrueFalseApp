import 'package:alistudentapp/flat_button.dart';
import 'package:alistudentapp/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';


QuizBrain quizBrain = QuizBrain();
class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer ){
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
        if(quizBrain.isFinished() == true ){
          showOkAlertDialog(context: context , title:
            'Finish'
            , );
          quizBrain.reset();
          scoreKeeper=[];

        }else {

      if (correctAnswer == userPickedAnswer){
        scoreKeeper.add(
            const Icon(
              Icons.check, color: Colors.green, size: 30.0,)
        );
        } else{
        scoreKeeper.add(
            const Icon(
              Icons.close, color: Colors.red,size: 30.0,)
        );
      }
      quizBrain.nextQuestion();
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

         Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
                ),
              ),
            ),),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FLatButton(Colors.green, (){
                checkAnswer(true);
              }, 'True'),
            )),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FLatButton(Colors.red, (){
                checkAnswer(false);
              }, 'False'),
            )),
        Row(
            children: scoreKeeper,
        ),
      ],
    );

  }
}
