import 'package:flutter/material.dart';

class Brick extends StatelessWidget {
  bool isLeadBrick = false;
  bool isFinalBrick = false;
  final Color color;
  static const double cellPadding = 1;
  final String text;

  Brick({this.isLeadBrick, this.isFinalBrick, color, this.text})
      : color = color ?? Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.only(
        top: cellPadding,
        right: cellPadding,
        left: cellPadding,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: color,
//          child: Text(text ?? '',style: TextStyle(fontSize: 16),),
        ),
      ),
    ));
  }
}
