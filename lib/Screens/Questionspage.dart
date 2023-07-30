import 'dart:ffi';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Data/questiondata.dart';

import 'Resultpage.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  ConfettiController controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    controller = ConfettiController(
      duration: new Duration(seconds: 1),
    );
  }

  var questionIndex = 0;
  List<String> selectedAnswer = [];

  // void Choose(String ans) {
  //   selectedAnswer.add(ans);
  //   var currentques = questionlist[questionIndex];
  //   var crtanswer = currentques.crtans;
  //   bool iscorrect = ans == currentques.crtans;
  //   currentques.iscrt = iscorrect;
  //   // setState(() {
  //   //   if (questionIndex < questionlist.length - 1) {
  //   // questionIndex++;}
  //   // });
  //   //if all questions are answered got to this page
  //   if (selectedAnswer.length < questionlist.length) {
  //     if (ans == crtanswer) {
  //       setState(() {});
  //       controller.play();
  //       Future.delayed(Duration(seconds: 2), () {
  //         setState(() {
  //           if (selectedAnswer.length < questionlist.length) {
  //             questionIndex++;
  //           }
  //         });
  //       });
  //     } else {
        
  //       setState(() {
  //         if (selectedAnswer.length < questionlist.length) {
  //           questionIndex++;
  //         }
  //       });
  //     }
  //   } else if (selectedAnswer.length == questionlist.length) {
  //     if (ans == crtanswer) {
  //       controller.play();
  //       Future.delayed(Duration(seconds: 2), () {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (Context) => ResultsPage(
  //                       SelectedAnswer: selectedAnswer,
  //                     )));
  //       });
  //     } else {
  //       Future.delayed(Duration(seconds: 1), () {
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (Context) => ResultsPage(
  //                       SelectedAnswer: selectedAnswer,
  //                     )));
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       if (selectedAnswer.length < questionlist.length) {
  //         questionIndex++;
  //       }
  //     });
  //   }
  // }

 void Choose(String ans) {
    setState(() {
      selectedAnswer.add(ans);
      var currentques = questionlist[questionIndex];
      var crtanswer = currentques.crtans;
      bool isCorrect = ans == crtanswer;

      if (isCorrect) {
        controller.play();
      }

      if (selectedAnswer.length < questionlist.length) {
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            if (selectedAnswer.length < questionlist.length) {
              questionIndex++;
            }
          });
        });
      } else {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsPage(
                SelectedAnswer: selectedAnswer,
              ),
            ),
          );
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    var currentQuestion = questionlist[questionIndex];
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pinkAccent.shade200, Colors.pinkAccent.shade200])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConfettiWidget(
              blastDirectionality: BlastDirectionality.explosive,
              confettiController: controller,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 30,
              gravity: 0.05,
              shouldLoop: false,
              colors: [
                Colors.green,
                Colors.red,
                Colors.blueAccent,
                Colors.purple,
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                currentQuestion.question,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ...questionlist[questionIndex].answer.map((ele) => AnswerButton(
                  answer: ele,
                  isSelected: selectedAnswer.contains(ele),
                  isCorrect: ele == currentQuestion.crtans,
                  onPressed: () {
                    Choose(ele);
                  },
                )),
          ],
        ),
      ),
    );
  }
}



class AnswerButton extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onPressed;

  AnswerButton({
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    if (isSelected) {
      backgroundColor = isCorrect ? Colors.green : Colors.red.shade700;
    } else {
      backgroundColor = Colors.pinkAccent.shade700;
    }

    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, top: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          foregroundColor: Colors.black,
          backgroundColor: backgroundColor,
        ),
        child: Text(answer,style: TextStyle(fontSize: 18),),
      ),
    );
  }
}
