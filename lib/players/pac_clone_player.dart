import 'package:bonfire/bonfire.dart';
import 'package:clone_pacman_app/main.dart';
import 'package:clone_pacman_app/players/game_sprite.dart';
import 'package:clone_pacman_app/players/gemas.dart';

class PacPlayer extends SimplePlayer with ObjectCollision, UseStateController<PlayerControlador> {
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
    if (component is Gem) {
  
    }
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
}

class PlayerControlador extends StateController<PacPlayer> {
  @override
  void update(double dt, PacPlayer component) {}
}
