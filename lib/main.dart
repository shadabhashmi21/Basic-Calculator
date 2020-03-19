import 'package:flutter/material.dart';

void main() => runApp(BasicCalculator());

class BasicCalculator extends StatefulWidget {
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  ///for storing output during first run, otherwise for storing the value of operand2 i.e. the output in first case
  String output = "0";
  ///for storing the output every time after first run
  String _output = "0";
  double operand1 = 0;
  double operand2 = 0;
  String operator = "";

  buttonPressed(String buttonText) {
    switch (buttonText) {
      case "C":
        reset();
        break;
      case "+":
      case "-":
      case "*":
      case "/":
        evaluate(buttonText);
        break;
      case "=":
        operand2 = double.parse(output);
        _output = calculate(operator, operand1, operand2);
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
    operand1 = 0;
    operand2 = 0;
    operator = "";
  }

  calculate(String _operator, double n1, double n2) {
    String temp = "0";
    switch (_operator) {
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
    reset();
    return temp;
  }

  evaluate(buttonText) {
    operand1 = double.parse(output);
    operator = buttonText;
    _output = "0";
  }
}
