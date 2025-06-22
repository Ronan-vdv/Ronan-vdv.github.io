//A  calculator app!

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = '0';
  String lastAdded = '';

  @override
  Widget build(BuildContext context) {
    const numButtonCol = Color.fromARGB(255, 102, 102, 102);
    const actionButtonCol = Colors.orange;
    const double displayFontSize = 50;
    const double horPadding = 20;
    const double vertPadding = 5;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            //The display of the calculator
            height: 100,
            width: double.infinity,
            child: SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Text(
                equation,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Colors.white, fontSize: displayFontSize),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: vertPadding, horizontal: horPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CalculatorKey(
                        colour: numButtonCol,
                        text: 'AC',
                        action: () {
                          setState(() {
                            equation = '0';
                            lastAdded = '';
                          });
                        },
                      ),
                      CalculatorKey(
                        colour: actionButtonCol,
                        text: '/',
                        action: () {
                          _addToEquation('/');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: vertPadding, horizontal: horPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '7',
                        action: () {
                          _addToEquation('7');
                        },
                      ),
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '8',
                        action: () {
                          _addToEquation('8');
                        },
                      ),
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '9',
                        action: () {
                          _addToEquation('9');
                        },
                      ),
                      CalculatorKey(
                        colour: actionButtonCol,
                        text: 'X',
                        action: () {
                          _addToEquation('*');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: vertPadding, horizontal: horPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '4',
                        action: () {
                          _addToEquation('4');
                        },
                      ),
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '5',
                        action: () {
                          _addToEquation('5');
                        },
                      ),
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '6',
                        action: () {
                          _addToEquation('6');
                        },
                      ),
                      CalculatorKey(
                        colour: actionButtonCol,
                        text: '-',
                        action: () {
                          _addToEquation('-');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: vertPadding, horizontal: horPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '1',
                        action: () {
                          _addToEquation('1');
                        },
                      ),
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '2',
                        action: () {
                          _addToEquation('2');
                        },
                      ),
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '3',
                        action: () {
                          _addToEquation('3');
                        },
                      ),
                      CalculatorKey(
                        colour: actionButtonCol,
                        text: '+',
                        action: () {
                          _addToEquation('+');
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: vertPadding, horizontal: horPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '0',
                        action: () {
                          _addToEquation('0');
                        },
                      ),
                      CalculatorKey(
                        colour: numButtonCol,
                        text: '.',
                        action: () {
                          _addToEquation('.');
                        },
                      ),
                      CalculatorKey(
                        colour: actionButtonCol,
                        text: '=',
                        action: () {
                          ExpressionParser p = GrammarParser();
                          try {
                            Expression exp = p.parse(equation.toLowerCase());
                            var evaluator = RealEvaluator();
                            num value = evaluator.evaluate(exp);
                            final f = NumberFormat("###.####");
                            String val = f.format(value);
                            setState(() {
                              equation = val;
                            });
                          } on Exception catch (e) {
                            setState(() {
                              equation = 'Error!';
                            });
                          }
                          lastAdded = '';
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String c) {
    switch (c) {
      case '/':
        return true;
      case '*':
        return true;
      case '+':
        return true;
      case '-':
        return true;
    }
    return false;
  }

//Add a single character (number, operation) to the equation
  void _addToEquation(String c) {
    String result;
    if (isOperator(c)) {
      if (isOperator(lastAdded)) {
        //Two operators in a row, so replace the old one
        String newEq = equation.replaceFirst(lastAdded, c, equation.length - 1);
        result = newEq;
      } else {
        result = equation + ' $c';
      }
    } else {
      //Not an operator
      result = equation + c;
    }

    setState(() {
      equation = result;
    });
    lastAdded = c;
  }
}

class CalculatorKey extends StatefulWidget {
  final VoidCallback action;
  final Color colour;
  final String text;
  const CalculatorKey(
      {super.key,
      required this.colour,
      required this.text,
      required this.action});
  @override
  State<CalculatorKey> createState() => _CalculatorKeyState();
}

class _CalculatorKeyState extends State<CalculatorKey> {
  @override
  Widget build(BuildContext context) {
    const double buttonSize = 70;
    const double fontSize = 30;
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: widget.action,
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          height: buttonSize,
          width: buttonSize,
          decoration: BoxDecoration(
            color: widget.colour,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
              child: Text(
            widget.text,
            style: const TextStyle(color: Colors.white, fontSize: fontSize),
          )),
        ),
      ),
    );
  }
}
