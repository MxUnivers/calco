import 'dart:ffi';

import 'package:calculatrice/widgets/button.dart';
import  "package:flutter/material.dart";
import 'package:math_expressions/math_expressions.dart';



void main()=> runApp(const Calculator());

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculatrice",
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {


    var  userInput  ='';
    var answer =  '0';

    List<String> buttons = [
      'C',
      '+/-',
      '%',
      'DEL',
      '7',
      '8',
      '9',
      '/',
      '4',
      '5',
      '6',
      'x',
      '1',
      '2',
      '3',
      '-',
      '0',
      '.',
      '=',
      '+',

    ];

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          Expanded(
              child:Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:20 ,  right:20 ,top: 70),
                      alignment: Alignment.centerRight,
                      child: Text(userInput ,  style : TextStyle(fontSize: 20,  fontWeight: FontWeight.w400,  color: Colors.grey[400])),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:15 ,  right:15 ),
                      alignment: Alignment.centerRight,
                      child: Text(answer ,  style : TextStyle(fontSize: 60,  fontWeight: FontWeight.w600,  color: Colors.grey[200])),
                    )
                  ],
                ),
              )
          ),
          Expanded(
              flex: 2,
            child: Container(
              margin: const  EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (BuildContext context , int index ){
                if(index  == 0){
                  return MyButton(
                    buttonapped: (){
                      setState(() {
                        userInput =  '';
                        answer = '0';
                      });
                    },
                    buttonText: buttons[index],
                    color: Colors.blue[50],
                    textColor: Colors.black
                  );
                }
                // +/-
                else if(index  == 1){
                  return MyButton(
                    buttonText: buttons[index],
                    color: Colors.blue[50],
                    textColor: Colors.black
                  );
                }

                // %
                else if(index  == 2){
                  return MyButton(
                    buttonapped: (){
                      setState((){
                        userInput += buttons[index];
                      });
                    },
                      buttonText: buttons[index],
                      color: Colors.blue[50],
                      textColor: Colors.black
                  );
                }

                // DEL
                else if(index  == 3){
                  return MyButton(
                      buttonapped: (){
                        setState((){
                          userInput = userInput.substring(0,  userInput.length-1);
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.blue[50],
                      textColor: Colors.black
                  );
                }

                // EQUAL
                else if(index  == 18){
                  return MyButton(
                      buttonapped: (){
                        setState((){
                          equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.orange[700],
                      textColor: Colors.black
                  );
                }


                // other
                else{
                  return MyButton(
                    buttonapped: (){
                      setState((){
                        userInput += buttons[index];
                      }
                      );
                    },
                    buttonText: buttons[index],
                    color: isOperator(buttons[index]) ? Colors.blueAccent :  Colors.white,
                    textColor: isOperator(buttons[index]) ? Colors.white :  Colors.black,
                  );
                }
              }),
            ),
          )
        ],
      ),
    );
  }
  bool isOperator(String o){
    if(o=='/' || o=='x' || o =='-' || o=='+' || o=='=' ) {
      return true;
    }
    return false ;
  }

  void  equalPressed(){
    String finaluserinput  =   userInput ;
    finaluserinput =  userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp =  p.parse(finaluserinput);
    ContextModel cm =  ContextModel();
    double  eval  =  exp.evaluate(EvaluationType.REAL, cm);
    answer =  eval.toString();
  }


}


