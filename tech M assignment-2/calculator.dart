import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  String result = '';

  void calculate(String op) {
    final num1 = double.tryParse(num1Controller.text);
    final num2 = double.tryParse(num2Controller.text);

    if (num1 == null || num2 == null) {
      setState(() {
        result = 'Please enter valid numbers.';
      });
      return;
    }

    double res;
    switch (op) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          setState(() => result = 'Cannot divide by zero.');
          return;
        }
        res = num1 / num2;
        break;
      case '%':
        if (num2 == 0) {
          setState(() => result = 'Cannot mod by zero.');
          return;
        }
        res = num1 % num2;
        break;
      default:
        res = 0;
    }

    setState(() {
      result = 'Result: \$res';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter first number'),
            ),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter second number'),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: ['+', '-', '*', '/', '%'].map((op) {
                return ElevatedButton(
                  onPressed: () => calculate(op),
                  child: Text(op),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}