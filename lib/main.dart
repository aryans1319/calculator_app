import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int firstNum, secondNum; // Two values for Calculation (+ - x /)
  late String output; // Its + - x /
  late String result, text = "";

  void btnClicked(String btnText) {
    if (btnText == "C") {
      // Reset Everything
      result = "";
      text = "";
      firstNum = 0;
      secondNum = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      firstNum = int.parse(text);
      result = "";
      output = btnText;
    } else if (btnText == "=") {
      secondNum = int.parse(text);
      if (output == "+") {
        result = (firstNum + secondNum).toString();
      } else if (output == "-") {
        result = (firstNum - secondNum).toString();
      } else if (output == "x") {
        result = (firstNum * secondNum).toString();
      } else if (output == "/") {
        result = (firstNum ~/ secondNum).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  Widget customOutlineButtons(String value) {
    return Expanded(
      child: OutlineButton(
        onPressed: () => btnClicked(value),
        padding: EdgeInsets.all(25),
        child: Text(
          value,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Calculator')),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orange,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text,
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                ),
              ),
              Row(
                children: [
                  customOutlineButtons("9"),
                  customOutlineButtons("8"),
                  customOutlineButtons("7"),
                  customOutlineButtons("+"),
                ],
              ),
              Row(
                children: [
                  customOutlineButtons("6"),
                  customOutlineButtons("5"),
                  customOutlineButtons("4"),
                  customOutlineButtons("-"),
                ],
              ),
              Row(
                children: [
                  customOutlineButtons("3"),
                  customOutlineButtons("2"),
                  customOutlineButtons("1"),
                  customOutlineButtons("x"),
                ],
              ),
              Row(
                children: [
                  customOutlineButtons("9"),
                  customOutlineButtons("8"),
                  customOutlineButtons("7"),
                  customOutlineButtons("+"),
                ],
              ),
              Row(
                children: [
                  customOutlineButtons("C"),
                  customOutlineButtons("0"),
                  customOutlineButtons("="),
                  customOutlineButtons("/"),
                ],
              )
            ],
          ),
        ));
  }
}
