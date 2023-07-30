import 'package:flutter/material.dart';
import 'package:quiz_app/Data/questiondata.dart';
import 'package:quiz_app/Screens/Splashscreen.dart';

class ResultsPage extends StatelessWidget {
  List<String> SelectedAnswer;
  ResultsPage({super.key, required this.SelectedAnswer});

  List<Map<String, dynamic>> getresults() {
    final List<Map<String, dynamic>> summary = [];
    for (int i = 0; i < SelectedAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questionlist[i].question,
        "correctans": questionlist[i].crtans,
        "userans": SelectedAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getresults();
    final totalquestions = questionlist.length;
    final numcrtquestions = summaryData
        .where((data) => data['userans'] == data['correctans'])
        .length;

    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.pinkAccent.shade700])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Text(
                  "You have answered $numcrtquestions out of $totalquestions",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

            SizedBox(
                height: 30,
              ),
              Image.asset('assets/win.png'),
             
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.only(left: 30,right: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      foregroundColor: Colors.pink.shade700,
                      side: BorderSide(
                        color: Colors.black,
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SplashScreen()));
                  },
                  child: Text('Restart',
                      style: TextStyle(color: Colors.black, fontSize: 22)))
            ],
          )),
    );
  }
}
