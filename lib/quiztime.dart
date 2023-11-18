import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
class quiztime extends StatefulWidget {
  final String calculationType='';
  const quiztime({super.key,required calculationType});

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
  late Timer timer;
  List<double> answers=[];

  @override
  void initState(){
    super.initState();
  }
  void timeout(){
    timer=Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(timing>0){
          timing--;
        }else{
          life--;
          //lfunction li btaamel generate lal soaal
        }
      });
    });
  }
  void generator(){
    first=rand.nextInt(9)+1.0;
    second=rand.nextInt(9)+1.0;

    switch(widget.calculationType){

      case '+':
        rightTotal=first+second;
        break;
      case '-':
        rightTotal=first-second;
        break;
      case '*':
        rightTotal=first*second;
        break;
      case '/':
        rightTotal=first/second;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
