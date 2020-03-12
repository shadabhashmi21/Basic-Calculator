import 'package:flutter/material.dart';

void main() => runApp(BasicCalculator());

class BasicCalculator extends StatefulWidget {
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  String output = "0";
  String _output = "0";
  double n1 = 0;
  double n2 = 0;
  String operator = "";

  buttonPressed(String buttonText) {
    switch (buttonText) {
      case "C":
        reset();
        break;
      case "+":
        evaluate(buttonText);
        break;
      case "-":
        evaluate(buttonText);
        break;
      case "*":
        evaluate(buttonText);
        break;
      case "/":
        evaluate(buttonText);
        break;
      case "=":
        n2 = double.parse(output);
        _output = calculate(operator, n1, n2);
        break;
      default:
        _output = _output + buttonText;
        break;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toString();
    });
  }

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
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 +
                      100.0,
                ),
                alignment: Alignment.bottomRight,
                color: Colors.white,
                child: Text(
                  output,
                  style: TextStyle(fontSize: 50, color: Colors.black),
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
                  _button("C"),
                  _button("0"),
                  _button("="),
                  _button("/"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _button(String buttonText) {
    return MaterialButton(
      height: 100.0,
      child: Text(buttonText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
      textColor: Colors.black,
      color: Colors.grey[100],
      onPressed: () => buttonPressed(buttonText),
    );
  }

  reset() {
    _output = "0";
    n1 = 0;
    n2 = 0;
    operator = "";
  }

  calculate(String operator, double n1, double n2) {
    String temp = "0";
    switch (operator) {
      case "+":
        temp = (n1 + n2).toString();
        break;
      case "-":
        temp = (n1 - n2).toString();
        break;
      case "*":
        temp = (n1 * n2).toString();
        break;
      case "/":
        temp = (n1 / n2).toString();
        break;
    }
    n1 = 0;
    n2 = 0;
    operator = "";
    return temp;
  }

  evaluate(buttonText) {
    n1 = double.parse(output);
    operator = buttonText;
    _output = "0";
  }
}
