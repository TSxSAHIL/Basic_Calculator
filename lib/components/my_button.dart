import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class MyButton extends StatelessWidget {
  final String title;
  final Color colour;
  final VoidCallback onPress;
  const MyButton({Key? key , this.title = '' , this.colour = Colors.grey , required this.onPress}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colour,
            ),
            child: Center(child: Text(title , style: TextStyle(fontSize: 24 , color: Colors.white) ,)),
          ),
        ),
      ),
    );
  }

  
}