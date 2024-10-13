import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {

  CustomContainer({required this.text, required this.margin});

  late String text;
  late EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Center(
        child: Text(text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}