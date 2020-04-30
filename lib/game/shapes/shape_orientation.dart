abstract class ShapeOrientationAbstract {
  EnumShapeOrientation _current;

  ShapeOrientationAbstract() : this._current = EnumShapeOrientation.one;

  void next();
  get current => _current;
}

enum EnumShapeOrientation { one, two, three, four }

class ShapeOrientation extends ShapeOrientationAbstract {
  ShapeOrientation() :super();

  @override
  void next() {
    switch (_current){
      case EnumShapeOrientation.one:
        _current = EnumShapeOrientation.two;
        break;
      case EnumShapeOrientation.two:
        _current = EnumShapeOrientation.three;
        break;
      case EnumShapeOrientation.three:
        _current = EnumShapeOrientation.four;
        break;
      case EnumShapeOrientation.four:
        _current = EnumShapeOrientation.one;
        break;
    }
  }
}