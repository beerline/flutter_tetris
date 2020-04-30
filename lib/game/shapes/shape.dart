import 'package:flutter/material.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/shapes/shape_orientation.dart';

abstract class ShapeAbstract {
  Color color;
  ShapeOrientationAbstract _orientation = ShapeOrientation();

  // TODO implement in future
//  counterClockwise();

  clockwise(PlayFieldAbstract playField);

//  List<BlockAbstract> coordinatesBlocks();

  bool detectCollision(PlayFieldAbstract playField);

  moveDown(int contBricksOnX);

  get orientation => _orientation;
  get blocks;
}


//
//class ZShape extends ShapeAbstract {}
//
//class LShape extends ShapeAbstract {}
//
//class JShape extends ShapeAbstract {}
//
//class OShape extends ShapeAbstract {}
//
//class IShape extends ShapeAbstract {}
//
//class TShape extends ShapeAbstract {}
