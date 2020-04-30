import 'package:flutter/material.dart';
import 'package:fluttertetris/game/game.dart';
import 'package:fluttertetris/game/ui_elements/game_field.dart';
import 'package:get_it/get_it.dart';
import 'injection_container.dart' as di;

final serviceLocator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  return runApp(TetrisApp());
}

class TetrisApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tetris',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainWidget(title: 'Flutter Tetris'),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  GameAbstract game;
  static const double cellPadding = 1;

  @override
  void initState() {
    super.initState();
    game = serviceLocator<GameAbstract>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Column(
            children: <Widget>[
              Flexible(
                flex: 5,
                child: Row(
                  children: <Widget>[
                    Flexible(flex: 3, child: GameField(game.playField)),
                    Flexible(
                      flex: 2,
                      child: Container(
                        height: 210,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Container(color: Colors.lightGreenAccent,width: 210,),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}