import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/Questionspage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: 
          [Colors.pinkAccent,Colors.pinkAccent.shade700])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset('assets/quizz.png',width: 130,)),
            SizedBox(height:30 ,),
            Text('Learn Skills By Attending Quiz',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
             SizedBox(height:18 ,),
             OutlinedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionPage()));
             }, 
             
             style: OutlinedButton.styleFrom(
              padding: EdgeInsets.only(left:20,right:20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
              foregroundColor: Colors.pink.shade700,
             side:BorderSide(color: Colors.black,)
             ),
             
             
              child: Text('Let\'s Start',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}