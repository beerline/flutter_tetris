import 'package:flutter/material.dart';
import 'package:fluttertetris/game/ui_elements/brick.dart';

class BricksRow extends StatelessWidget {
  List<Brick> bricks;

  BricksRow(this.bricks);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: bricks,
      ),
    );
  }
}
