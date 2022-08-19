import 'package:bonfire/bonfire.dart';
import 'package:clone_pacman_app/players/gemas.dart';
import 'package:clone_pacman_app/players/pac_clone_player.dart';
import 'package:flutter/material.dart';

import 'game/game.dart';
import 'game/start_game_page.dart';

const double tabuleiroSize = 16;

void main() {
  BonfireInjector.instance.put((i) => ScorePointController());
  WidgetsFlutterBinding.ensureInitialized();

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
  
  late ScorePointController scorePointController;

  @override
  void initState() {
    scorePointController = BonfireInjector.instance.get();
    scorePointController.addListener(_listener);
    controller = GameController()..addListener(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text('Points : ${scorePointController.score}')
         
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
    
  }

  void _listener() {
    setState(() {});
  }
}

class ScorePointController extends ChangeNotifier {
  int _score = 0;

  int get score => _score;

  void increment({int qtd = 10}) {
    _score += qtd;
    notifyListeners();
  }
}
