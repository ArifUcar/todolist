import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "todo app",textAlign: TextAlign.center,style: TextStyle(color: Colors.orange,fontSize: 80,fontWeight: FontWeight.bold),
    );
  }
}