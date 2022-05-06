import 'package:flutter/material.dart';

class SubTittle extends StatelessWidget {
  SubTittle({required this.sub});
  String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        sub,
        style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
