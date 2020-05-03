import 'package:flutter/material.dart';
import 'package:fluttertetris/game/block.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

class TurnException implements Exception {}

abstract class ShapeAbstract {
  Color color;
  List<BlockAbstract> blocks;
  ShapeOrientationAbstract _orientation = ShapeOrientation();


  ShapeAbstract(this.blocks, this.color);
//  counterClockwise();

  clockwise(PlayFieldAbstract playField);

//  List<BlockAbstract> coordinatesBlocks();

  get orientation => _orientation;

  bool detectStackCollision(PlayFieldAbstract playField) {
    var isCollision = false;

    for (final b in blocks) {
      if (b.coordinate + playField.xSize >= playField.xSize * playField.ySize) {
        // reach the bottom
        isCollision = true;
        break;
      } else if (playField.blocks != null &&
          playField.blocks.containsKey(b.coordinate + playField.xSize)) {
        // reach another shape
        isCollision = true;
      }
    }

    return isCollision;
  }

  bool detectLeftCollision(PlayFieldAbstract playField) {
    bool isCollision = false;
    for (final b in blocks) {
      if ((b.coordinate ) % playField.xSize == 0) {
        //reach lift boundary
        isCollision = true;
        break;
      }else if (playField.blocks.containsKey(b.coordinate - 1)) {
        // reach another shape on the left
        isCollision = true;
        break;
      }
    }
    return isCollision;
  }

  bool detectRightCollision(PlayFieldAbstract playField) {
    bool isCollision = false;
    for (final b in blocks) {
      if ((b.coordinate + 1 ) % playField.xSize == 0) {
        // reach right boundary
        isCollision = true;
        break;
      } else if (playField.blocks.containsKey(b.coordinate + 1)) {
        // reach another shape on the right
        isCollision = true;
        break;
      }
    }

    return isCollision;
  }

  moveDown(PlayFieldAbstract playField) {
    if (!detectStackCollision(playField)) {
      blocks.forEach((b) {
        b.coordinate += playField.xSize;
      });
    }
  }

  moveRight(PlayFieldAbstract playField) {
    if (!detectRightCollision(playField)) {
      blocks.forEach((b) {
        b.coordinate += 1;
      });
    }
  }

  moveLeft(PlayFieldAbstract playField) {
    if (!detectLeftCollision(playField)) {
      blocks.forEach((b) {
        b.coordinate -= 1;
      });
    }
  }
}