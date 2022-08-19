import 'package:bonfire/bonfire.dart';
import 'package:clone_pacman_app/players/game_sprite.dart';

import '../main.dart';

class PacPlayer extends SimplePlayer with ObjectCollision, UseStateController<PlayerControlador> {
  late ScorePointController scorePointController;
  PacPlayer({required super.position, required super.size})
      : super(
          animation: SimpleDirectionAnimation(
            idleRight: PacSprite.pacIdleRight,
            idleLeft: PacSprite.pacIdleLeft,
            runRight: PacSprite.pacRunRight,
            runLeft: PacSprite.pacRunLeft,
            runUp: PacSprite.pacRunUp,
            runDown: PacSprite.pacRunDown,
          ),
          speed: 70,
          life: 10,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(
        size: Vector2(15, 15),
        align: Vector2(5, 8),
      ),
    ]));
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    
    super.onCollision(component, active);

    return super.onCollision(component, active);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void die() {
    animation?.playOnce(
      PacSpriteDeath.pacDeath,
      runToTheEnd: true,
      onFinish: () => removeFromParent(),
    );

    super.die();
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN && event.id == 1) {
      if (gameRef.visibleComponents().length < 14) {
        atackGhost();
      }
    }
    super.joystickAction(event);
  }

  void atackGhost() {
    simpleAttackRange(
        animationRight: Attack.simpleAttack(),
        animationLeft: Attack.simpleAttack(),
        animationUp: Attack.simpleAttack(),
        animationDown: Attack.simpleAttack(),
        size: size,
        damage: 20,
        enableDiagonal: false);
  }
   @override
  void onMount() {
    scorePointController = BonfireInjector.instance.get();
    super.onMount();
  }

  void incrementScore() {
    scorePointController.increment();
  }
}

class PlayerControlador extends StateController<PacPlayer> {
  @override
  void update(double dt, PacPlayer component) {}
}
