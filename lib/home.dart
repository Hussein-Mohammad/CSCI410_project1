import 'package:flutter/material.dart';
import 'quiztime.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mathiology', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),) ,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  quiztime(calculationType: '+'),
                  ),
                );
              },
              child: Text('Addition'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  quiztime(calculationType: '-'),
                  ),
                );
              },
              child: Text('subtraction'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  quiztime(calculationType: 'x'),
                  ),
                );
              },
              child: Text('Multiplication'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  quiztime(calculationType: '/'),
                  ),
                );
              },
              child: Text('Division'),
            ),
          ],
        ),
      ),
    );
  }
}