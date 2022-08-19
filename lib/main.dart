import 'package:bonfire/bonfire.dart';
import 'package:clone_pacman_app/players/gemas.dart';
import 'package:clone_pacman_app/players/pac_clone_player.dart';
import 'package:flutter/material.dart';

import 'game/game.dart';
import 'game/start_game_page.dart';

const double tabuleiroSize = 16;

void main() {
  
  BonfireInjector.instance.put(
    (i) => PlayerControlador(),
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacman Clone',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const StartGamePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeGamePage extends StatefulWidget {
  const HomeGamePage({Key? key}) : super(key: key);

  @override
  State<HomeGamePage> createState() => _HomeGamePageState();
}

class _HomeGamePageState extends State<HomeGamePage> implements GameListener {
  late GameController controller;
  GemBloc gemBloc = GemBloc();

  @override
  void initState() {
    controller = GameController()..addListener(this);

    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: StreamBuilder<int>(
            initialData: 0,
            stream: gemBloc.output,
            builder: (context, snapshot) {
              return Text('Points: ${snapshot.data}');
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GamePac(controller: controller),
      ),
    );
  }

  @override
  void changeCountLiveEnemies(int count) {}

  @override
  void updateGame() {
    gemBloc.incrementCounter;
  }
}
