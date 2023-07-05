import 'package:flutter/material.dart';

import 'main1.dart';
class ResultScreen extends StatefulWidget {
  final int score;
  ResultScreen({required this.score});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Color maincolr = Color(0xFF252c4a);
  Color secondarycolor = Color(0xFF117eeb);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolr,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Congratulations",style: TextStyle(
              color: Colors.white,
              fontSize:38.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 20,),
            Text("Your Score is",style: TextStyle(
              color: Colors.white,
              fontSize:28.0,
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(
              height: 50,
            ),
            Text("${widget.score}",style: TextStyle(
              color: Colors.orange,
              fontSize: 80.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 20,
            ),
            MaterialButton(onPressed:() {
             Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
              color: Colors.orange,
              textColor: Colors.white,
              child: Text("Repeat the quizz"),
            )
          ],

        ),
      ),

    );
  }
}
