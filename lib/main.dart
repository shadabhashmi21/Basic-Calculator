import 'package:flutter/material.dart';

void main() => runApp(BasicCalculator());

class BasicCalculator extends StatefulWidget {
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Basic Calculator"),
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.white70,
        body: new Container(
        ),
      ),
    );
  }
}

void calculate() {

}
