import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class WinGame extends GameComponent {
  bool win = false;

  @override
  void update(double dt) {
    if (checkInterval('WinGame', 300, dt)) {
      if (gameRef.decorations().isEmpty == true && !win) {
        win = true;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Center(
                  heightFactor: 0.4,
                  child: Text(
                    'Parabéns você Venceu',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        loadStage();
                      },
                      child: const Text(
                        'Iniciar novamente',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              );
            });
      }
    }
  }

  void loadStage() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const HomeGamePage();
      }),
      (route) => false,
    );
  }
}

class GameOver extends GameComponent {
  bool gameOver = false;

  @override
  void update(double dt) {
    if (checkInterval('GameOver', 300, dt)) {
      if (gameRef.player?.isDead == true && !gameOver) {
        gameOver = true;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Center(
                  heightFactor: 0.4,
                  child: Text(
                    'Game Over',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        loadStage();
                      },
                      child: const Text(
                        'Tentar Novamente',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ))
                ],
              );
            });
      }
    }
  }

  void loadStage() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return const HomeGamePage();
      }),
      (route) => false,
    );
  }
}
