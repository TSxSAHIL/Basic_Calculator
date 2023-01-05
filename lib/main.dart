import 'package:calculator_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Application',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text('Calculator' , style: TextStyle( fontSize: 28 , color: Color(0xffffa00a)),)),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children:[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical :20.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(userInput.toString() , style: TextStyle(fontSize: 30 , color: Colors.white),)),
                        const Divider(
                          height: 60,
                          color: Colors.white,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(answer.toString() , style: TextStyle(fontSize: 30 , color: Colors.white), textAlign: TextAlign.end ,)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                    children: [
                      MyButton(title: 'AC',onPress: () {
                        userInput = '';
                        answer = '';
                        setState(() {});
                      },),
                      MyButton(title: '+/-',onPress: () {
                        userInput += '+/-';
                        answer = '';
                        setState(() {});
                      }),
                      MyButton(title: '%',onPress: () {
                        userInput += '%';
                        answer = '';
                        setState(() {});
                      }),
                      MyButton(title: '/', colour: Color(0xffffa00a),onPress: () {
                        userInput += '/';
                        answer = '';
                        setState(() {});
                      }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(title: '7',onPress: () {
                        userInput += '7';
                        setState(() {});
                      },),
                      MyButton(title: '8',onPress: () {
                        userInput += '8';
                        setState(() {});
                      }),
                      MyButton(title: '9',onPress: () {
                        userInput += '9';
                        setState(() {});
                      }),
                      MyButton(title: '×', colour: Color(0xffffa00a),onPress: () {
                        userInput += '×';
                        setState(() {});
                      }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(title: '4',onPress: () {
                        userInput += '4';
                        setState(() {});
                      },),
                      MyButton(title: '5',onPress: () {
                        userInput += '5';
                        setState(() {});
                      }),
                      MyButton(title: '6',onPress: () {
                        userInput += '6';
                        setState(() {});
                      }),
                      MyButton(title: '-', colour: Color(0xffffa00a),onPress: () {
                        userInput += '-';
                        setState(() {});
                      }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(title: '1',onPress: () {
                        userInput += '1';
                        setState(() {});
                      },),
                      MyButton(title: '2',onPress: () {
                        userInput += '2';
                        setState(() {});
                      }),
                      MyButton(title: '3',onPress: () {
                        userInput += '3';
                        setState(() {});
                      }),
                      MyButton(title: '+', colour: Color(0xffffa00a),onPress: () {
                        userInput += '+';
                        setState(() {});
                      }),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(title: '0',onPress: () {
                        userInput += '0';
                        setState(() {});
                      },),
                      MyButton(title: '.',onPress: () {
                        userInput += '.';
                        setState(() {});
                      }),
                      MyButton(title: 'DEL',onPress: () {
                        userInput = userInput.substring(0 , userInput.length-1);
                        setState(() {});
                      }),
                      MyButton(title: '=', colour: Color(0xffffa00a),onPress: () {
                        equalPress();
                        setState(() {
                          
                        });
                      }),
                    ],
                  ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void equalPress(){
    String finalUserInput = userInput.replaceAll('×', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
    answer = eval.toString();
  }
}


