import 'package:flutter/material.dart';

void main() => runApp(Quizler());
class Quizler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.black,
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: QuizPage(),
      ),
    )
  ),
);
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  List<String> questions=[
    'There are two moons of the planet Mars.',
    'Saturn has no rings around it.',
    'Moon\'s gravity is one-sixth to that of Earth\'s',
    'Neil Armstrong is not the first man to step on moon',
    'Voyager 1 has crossed oort cloud',
    ];
  List<bool> answers=[true,false,true,false,true];
  int questionnumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex:5,
          child: Center(
            child: Text(questions[questionnumber],
          textAlign: TextAlign.center,
          style:
            TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.0
          )),
          )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
            color: Colors.cyan,
            onPressed: (){
              bool correctanswer = answers[questionnumber];
              //True statement
              setState(() {
              questionnumber++;
                if(correctanswer)
                {
                  scorekeeper.add(
                    Icon(
                      Icons.check,
                      color:Colors.green
                    )
                  );
                }
                else{
                  scorekeeper.add(
                    Icon(
                      Icons.close,
                      color:Colors.red
                    )
                  );
                }
              });
            },
            child: Text("True",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0
            ),),
          ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
            color: Colors.cyan,
            onPressed: (){
              //False statement
              bool correctanswer = answers[questionnumber];
              setState(() {
               questionnumber++;
                if(correctanswer)
                {
                  scorekeeper.add(
                    Icon(
                      Icons.close,
                      color:Colors.red
                    )
                  );
                }
                else{
                  scorekeeper.add(
                    Icon(
                      Icons.check,
                      color:Colors.green
                    )
                  );
                }
              });
            },
            child: Text("False",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.0
            )),
          ),
          ),
        ),
        Row(
          children: scorekeeper
        )
        ],
    );
  }
}
