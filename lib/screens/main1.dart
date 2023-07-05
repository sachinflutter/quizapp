import 'package:flutter/material.dart';
import 'package:quizapp/data/questionslistfile.dart';
import 'package:quizapp/screens/resultscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //step1: we nees to create the folder structure of the app
  //step2: Then we need to create the model for our quizz app
  //step3: and we need simple list of question to display it
  //in our screen.
  Color maincolr = Color(0xFF252c4a);
  Color secondarycolor = Color(0xFF117eeb);

  //pagecontroller for our pageview
  PageController? _controller = PageController(initialPage: 0);

  //setting the game variable
  bool ispressed = false;
  Color trueanswer = Colors.green;
  Color wronganswer = Colors.red;
  Color btncolor = Color(0xFF117eeb);
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolr,
      body: Padding(
        padding: EdgeInsets.all(18),
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              ispressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question ${index + 1}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  questions[index].question!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                  ),
                ),
                //list of buttons
                SizedBox(
                  height: 35.0,
                ),
                for (int i = 0; i < questions[index].answers!.length; i++)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 18.0),
                    child: MaterialButton(
                      shape: StadiumBorder(),
                      color: ispressed
                          ? questions[index].answers!.entries.toList()[i].value
                              ? trueanswer
                              : wronganswer
                          : btncolor,
                      onPressed: ispressed
                          ? () {}
                          : () {
                              setState(() {
                                ispressed = true;
                              });
                              if (questions[index]
                                  .answers!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                                print(score);
                              }
                            },
                      child: Text(questions[index].answers!.keys.toList()[i]),
                    ),
                  ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                         shape: StadiumBorder(),
                          side: BorderSide(color: Colors.orange,width: 1.0),
                        ),
                        onPressed: ispressed ? index + 1 == questions.length ? () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => ResultScreen(score: score),));
                                  } : () {
                                    _controller?.nextPage(
                                        duration: Duration(milliseconds: 750),
                                        curve: Curves.easeInExpo);
                                    setState(() {
                                      ispressed=false;
                                    });
                                  }
                            : null,
                        child: Text(
                          index + 1 == questions.length
                              ? "see results"
                              : "Next question",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
