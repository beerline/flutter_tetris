import 'package:fluttertetris/game/coordinte.dart';

abstract class BlockAbstract {
  int coordinate;

  BlockAbstract(this.coordinate);

}

class Block extends BlockAbstract {
  Block(int coordinate) : super(coordinate);
}
