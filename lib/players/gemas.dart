
import 'package:bonfire/bonfire.dart';
import 'package:clone_pacman_app/players/pac_clone_player.dart';



class Gem extends GameDecoration with ObjectCollision {

  
  
  Gem(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('crystal_01f.png'),
          position: position,
          size: Vector2(16, 16),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(16, 16),
            align: Vector2(0, 0),
          ),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is PacPlayer) {
      component.incrementScore();
      removeFromParent();
    }
    super.onCollision(component, active);

    return super.onCollision(component, active);
  }

 
}
