import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
class quiztime extends StatefulWidget {
  final String calculationType;
  quiztime({Key? key, required this.calculationType}) : super(key: key);

  @override
  State<quiztime> createState() => _quiztimeState();
}

class _quiztimeState extends State<quiztime> {
  Random rand = Random();
  double first=0;
  double second=0;
  double rightTotal=0;
  int life=3;
  int timing=5;
  int counter=0;
  late Timer timer;
  List<double> answers=[];
  String libadakye='';
  @override
  void initState(){
    super.initState();
    timeout();
    generator();

  }
  void timeout() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timing > 0) {
          timing--;
        } else {
          life--;
          generator();
        }
      });
    });
  }
  void generator(){

    resetTimer();
    timer.cancel();
    if(life==0){
      timer.cancel();
      showRestartDialog();
      return;
    }
    if(counter==10){
      timer.cancel();
      showWinDialog();
      return;
    }
    first=rand.nextInt(9)+1.0;
    second=rand.nextInt(9)+1.0;

    switch(widget.calculationType){

      case '+':
        libadakye='Addition';
        rightTotal=first+second;
        break;
      case '-':
        libadakye='Subtraction';
        rightTotal=first-second;
        break;
      case 'x':
        libadakye='Multiplication';
        rightTotal=first*second;
        break;
      case '/':
        libadakye='Division';
        rightTotal=first/second;
        break;
    }
    answers=[rightTotal];
    for(int i=0;i<=2;i++){
      double wrongTotal=0;
      if(widget.calculationType=='/'){
        wrongTotal=rand.nextDouble()*10.0;
      }else{
        wrongTotal=rand.nextInt(9)+1.0;
      }
      if(!answers.contains(wrongTotal)){
        answers.add(wrongTotal);
      }else{
        i--;
      }
    }
    answers.shuffle();
    timeout();
  }
void resetTimer(){
    setState(() {
      timing=5;
    });
}

  void showRestartDialog(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Game Over'),
        content: const Text('You lost all your lives. Do you want to play again?'),
        actions: [
          ElevatedButton(onPressed: (){
            setState(() {
              life = 3;
              counter = 0;
              generator();
            });
            Navigator.of(context).pop();
          }, child: const Text('Restart')),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Go Home'),
          ),
        ],
      );
    });
  }
  void showWinDialog(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Congrats'),
        content: const Text('You won!'),
        actions: [
          ElevatedButton(onPressed: (){
            setState(() {
              life = 3;
              counter = 0;
              generator();
            });
            Navigator.of(context).pop();
          }, child: const Text('Restart')),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Go Home'),
          ),
        ],
      );
    });
  }
  void checkResult(double clicked){
    if(clicked==rightTotal){
      setState(() {
        counter++;
      });}
    else{
      setState(() {
        life--;
      });
    }
    generator();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(libadakye),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text('${first.toInt()} ${widget.calculationType} ${second.toInt()} = '),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  timer.cancel();
                  checkResult(answers[0]);
                }, child:Text(answers[0].toString()) ),
                ElevatedButton(onPressed: (){
                  timer.cancel();
                  checkResult(answers[1]);
                }, child:Text(answers[1].toString()) )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton(onPressed: (){
                  timer.cancel();
                  checkResult(answers[2]);
                }, child:Text(answers[2].toString()) ),
                ElevatedButton(onPressed: (){
                  timer.cancel();
                  checkResult(answers[3]);
                }, child:Text(answers[3].toString()) )
              ],
            ),
            Text('lives: $life'),
            Text('Time Left: $timing')
          ],
        ),
      ),

    );
  }
}
