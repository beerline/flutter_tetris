import 'package:flutter/material.dart';
import 'package:fluttertetris/game/game.dart';
import 'package:fluttertetris/game/ui_elements/brick.dart';
import 'package:fluttertetris/game/ui_elements/bricks_row.dart';

class GameField extends StatelessWidget {
  GameAbstract game;

  GameField(this.game) : super();

  @override
  Widget build(BuildContext context) {
    if (game is GameAbstract) {
      Widget buildBoard() {
        List<Widget> rows = [];
        int cellOrderNumber = 0;
        for (int i = 0; i < game.playField.ySize; i++) {
          List<Brick> bricks = [];
          for (int j = 0; j < game.playField.xSize; j++) {
            cellOrderNumber++;
            Color color;
            if (game.playField.blocks != null &&
                game.playField.blocks.containsKey(cellOrderNumber)) {
              color = game.playField.blocks[cellOrderNumber].color;
            } else if (game.playingShape != null &&
                game.playingShape.blocks.firstWhere((b) {
                      return b.coordinate == cellOrderNumber;
                    }, orElse: () => null) !=
                    null) {
              color = game.playingShape.blocks[0].color;
            } else {
              color = game.playField.colorBackGroundBlock;
            }

            Brick brick = Brick(color: color,);
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
    } else {
      return SizedBox();
    }
  }
}
