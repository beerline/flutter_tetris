import 'package:fluttertetris/game/game.dart';
import 'package:fluttertetris/game/level.dart';
import 'package:fluttertetris/game/play_field.dart';
import 'package:fluttertetris/game/scores.dart';
import 'package:fluttertetris/game/speed.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

init() async {
  serviceLocator.registerFactory<GameAbstract>(() => Game(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ));
  serviceLocator.registerFactory<PlayFieldAbstract>(() => PlayField());
  serviceLocator.registerFactory<LevelAbstract>(() => Level());
  serviceLocator.registerFactory<SpeedAbstract>(() => NesSpeed());
  serviceLocator.registerFactory<ScoreAbstract>(() => ScoreOriginalNest());
}
