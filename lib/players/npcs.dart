import 'package:bonfire/bonfire.dart';
import 'package:clone_pacman_app/players/game_sprite.dart';

const double tabuleiroSize = 16;

class NpcPlayer extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {
  NpcPlayer({required super.position, required super.size})
      : super(
          animation: SimpleDirectionAnimation(
            idleRight: NpcSprite.npcIdleRight,
            idleLeft: NpcSprite.npcIdleLeft,
            runRight: NpcSprite.npcRunRight,
            runLeft: NpcSprite.npcRunLeft,
            runUp: NpcSprite.npcRunUp,
            runDown: NpcSprite.npcRunDown,
          ),
          speed: 25,
          life: 10,
        ) {
    setupCollision(
      CollisionConfig(collisions: [
        CollisionArea.rectangle(
          size: Vector2(14, 15),
          align: Vector2(6, 8),
        ),
      ]),
    );
  }
  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is Attack) {
      removeFromParent();
    }
    super.onCollision(component, active);

    return super.onCollision(component, active);
  }
  

  @override
  void update(double dt) {
    
    
    seeAndMoveToPlayer(
      closePlayer: (player) {
        simpleAttackMelee(
            damage: 100,
            size: Vector2(20, 20),
            direction: lastDirection,
            withPush: true,
            sizePush: 10);
      },
      notObserved: () => runRandomMovement(
      dt,
      speed: speed / 3,
      maxDistance: (tabuleiroSize * tabuleiroSize).toInt(),
    ),
      radiusVision: tabuleiroSize * 10,
    );

    super.update(dt);
  }

  @override
  void die() {
    // controller.respawn(position);
    animation?.playOnce(
      NpcSpriteDeath.npcDeath,
      runToTheEnd: true,
      onFinish: () => removeFromParent(),
    );
    super.die();
  }
}
