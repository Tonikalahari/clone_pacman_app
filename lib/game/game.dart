

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import '../component/components.dart';
import '../players/gemas.dart';
import '../players/npcs.dart';
import '../players/pac_clone_player.dart';
const double tabuleiroSize = 16;
class GamePac extends StatefulWidget {
  const GamePac({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final GameController controller;

  @override
  State<GamePac> createState() => _GamePacState();
}

class _GamePacState extends State<GamePac> {
  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      gameController: widget.controller,
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      map: TiledWorldMap(
        'pcman_mapa.json',
        objectsBuilder: {'': (p) => Gem(p.position)},
        forceTileSize: const Size(tabuleiroSize, tabuleiroSize),
      ),
      player: PacPlayer(position: Vector2(32, 20), size: Vector2(24, 24)),
      cameraConfig: CameraConfig(moveOnlyMapArea: true, smoothCameraEnabled: true, zoom: 1.2),
      components: [
        WinGame(),
        GameOver(),
        NpcPlayer(position: Vector2(12 * tabuleiroSize, 16 * tabuleiroSize), size: Vector2(24, 24)),
        NpcPlayer(position: Vector2(15 * tabuleiroSize, 16 * tabuleiroSize), size: Vector2(24, 24)),
        NpcPlayer(position: Vector2(17 * tabuleiroSize, 16 * tabuleiroSize), size: Vector2(24, 24)),
        NpcPlayer(position: Vector2(15 * tabuleiroSize, 26 * tabuleiroSize), size: Vector2(24, 24)),
      ],
    );
  }
}
