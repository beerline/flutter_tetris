abstract class LevelAbstract {
  int _current;

  int get current => _current;

  LevelAbstract(this._current);

}

class Level extends LevelAbstract{

  Level({int level}) : super(level ?? 0);
}