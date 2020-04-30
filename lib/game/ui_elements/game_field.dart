import 'package:flutter/material.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/ui_elements/brick.dart';
import 'package:fluttertetris/game/ui_elements/bricks_row.dart';

class GameField extends StatelessWidget {
  PlayFieldAbstract playField;

  GameField(this.playField) : super();

  @override
  Widget build(BuildContext context) {

    Widget buildBoard() {
      List<Widget> rows = [];
      for (int i = 0; i < playField.ySize; i++) {
        List<Brick> bricks = [];
        for (int j = 0; j < playField.xSize; j++) {
          Brick brick = Brick();
          bricks.add(brick);
        }
        BricksRow row = BricksRow(bricks);
        rows.add(row);
      }

      return Container(
        child: Column(children: rows),
      );
    }

    var newWidget = buildBoard();
    return newWidget;
  }
}
