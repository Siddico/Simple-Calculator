import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcPage extends StatefulWidget {
  CalcPage({super.key});
  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  List<String> symbols = [
    'AC',
    'Del',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '+',
    '3',
    '2',
    '1',
    '-',
    '.',
    '0',
    'Ans',
    '='
  ];
  String input = '';
  String output = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Text(
                    input,
                    style: TextStyle(
                        fontSize: 32,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  )),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
              child: Container(
                  width: double.infinity,
                  height: 40,
                  child: Text(
                    output,
                    style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(255, 21, 82, 187),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  )),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    if (symbols[index] == 'AC') {
                      setState(() {
                        input = '';
                        output = '';
                      });
                    } else if (symbols[index] == 'Del') {
                      setState(() {
                        input = input.substring(0, input.length - 1);
                      });
                    } else if (symbols[index] == 'Ans') {
                      setState(() {
                        input = output;
                        output = '';
                      });
                    } else if (symbols[index] == '=') {
                      Expression expression = Parser().parse(input);
                      double result = expression.evaluate(
                          EvaluationType.REAL, ContextModel());
                      setState(() {
                        output = result.toString();
                        //input = output;
                        //output = '';
                      });
                    } else if (symbols[index] == '%' ||
                        symbols[index] == '/' ||
                        symbols[index] == '*' ||
                        symbols[index] == '-' ||
                        symbols[index] == '+') {
                      if (input.endsWith('%') ||
                          input.endsWith('/') ||
                          input.endsWith('*') ||
                          input.endsWith('-') ||
                          input.endsWith('+')) {
                        null;
                      } else {
                        setState(() {
                          input += symbols[index];
                        });
                      }
                    } else {
                      setState(() {
                        input += symbols[index];
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          color: myBackGroundColor(symbols[index])),
                      alignment: Alignment.center,
                      child: Text(
                        symbols[index],
                        style: TextStyle(
                            color: textColor(symbols[index]),
                            fontSize: 32,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                );
              }),
              itemCount: symbols.length,
            ),
          )
        ],
      ),
    );
  }

  Color myBackGroundColor(String x) {
    if (x == 'AC') {
      return Colors.teal;
    } else if (x == 'Del') {
      return Colors.red;
    } else if (x == '/' ||
        x == '*' ||
        x == '-' ||
        x == '+' ||
        x == '%' ||
        x == '=') {
      return Colors.blue;
    } else if (x == 'Ans') {
      return Colors.green;
    } else {
      return const Color.fromARGB(255, 218, 218, 218);
    }
  }

  Color textColor(String x) {
    if (x == 'AC' ||
        x == '/' ||
        x == '*' ||
        x == '-' ||
        x == '+' ||
        x == '%' ||
        x == 'Del' ||
        x == '=') {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
