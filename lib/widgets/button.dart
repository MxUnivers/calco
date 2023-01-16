
import  "package:flutter/material.dart" ;





class MyButton extends StatelessWidget {

  final color ;
  final textColor ;
  final String buttonText ;
  final buttonapped ;

  MyButton({this.color ,  this.textColor ,  this.buttonText="",  this.buttonapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonapped,
      child:  Padding(
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            alignment: Alignment.center,
            color: color,
            child: Text(buttonText ,  style: TextStyle(fontSize: 30 ,  fontWeight: FontWeight.w400),),

          ),
        ),
      ),

    );
  }
}
