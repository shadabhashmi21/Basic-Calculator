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
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
                ),
                alignment: Alignment.bottomRight,
                color: Colors.white,
                child: Text("0",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black
                ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("9"),
                  _button("8"),
                  _button("7"),
                  _button("+"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("6"),
                  _button("5"),
                  _button("4"),
                  _button("-"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("3"),
                  _button("2"),
                  _button("1"),
                  _button("*"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("C", /*_clear*/),
                  _button("0", /*_zero*/),
                  _button("=", /*_disp*/),
                  _button("/", /*_div*/),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _button(String number, /*Function() f*/){
    return MaterialButton(
      height: 100.0,
      child: Text(number,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      color: Colors.grey[100],
      //onPressed: f,
    );
  }
}

class _div {
}
