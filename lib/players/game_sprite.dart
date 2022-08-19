import 'package:flame/components.dart';

/// Nesse arquivo definimos a animação do player por meio de uma classe que nomeamos de PacSprite,
/// cada bloco de código determina a quantidade de frames "amount:"  para imitar o movimento do player
/// baseado no arquivo png que deve ser provido via assets,
/// o tempo de animação entre os frames "stepTime:", o tamanho de cada frame "textureSize:" e a posição de onde se inicia
/// a mudança dos frames "texturePosition:"

class PacSprite {
  static Future<SpriteAnimation> get pacIdleRight => SpriteAnimation.load(
        'mHero_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.13,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(0, 0)),
      );
  static Future<SpriteAnimation> get pacIdleLeft => SpriteAnimation.load(
        'mHero_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.13,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 0)),
      );
  static Future<SpriteAnimation> get pacRunRight => SpriteAnimation.load(
        'mHero_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.13,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(0, 48)),
      );
  static Future<SpriteAnimation> get pacRunLeft => SpriteAnimation.load(
        'mHero_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.13,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 48)),
      );
  static Future<SpriteAnimation> get pacRunUp => SpriteAnimation.load(
        'mHero_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.13,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 24)),
      );
  static Future<SpriteAnimation> get pacRunDown => SpriteAnimation.load(
        'mHero_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.13,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(0, 24)),
      );
}

class PacSpriteDeath {
  static Future<SpriteAnimation> get pacDeath => SpriteAnimation.load(
        'mHero_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.13,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 120)),
      );
}

class NpcSprite {
  static Future<SpriteAnimation> get npcIdleRight => SpriteAnimation.load(
        'ghost_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.18,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(0, 48)),
      );
  static Future<SpriteAnimation> get npcIdleLeft => SpriteAnimation.load(
        'ghost_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.18,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 48)),
      );
  static Future<SpriteAnimation> get npcRunRight => SpriteAnimation.load(
        'ghost_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.18,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(0, 48)),
      );
  static Future<SpriteAnimation> get npcRunLeft => SpriteAnimation.load(
        'ghost_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.18,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 48)),
      );
  static Future<SpriteAnimation> get npcRunUp => SpriteAnimation.load(
        'ghost_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.18,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 24)),
      );
  static Future<SpriteAnimation> get npcRunDown => SpriteAnimation.load(
        'ghost_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.18,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(0, 24)),
      );
}

class NpcSpriteDeath {
  static Future<SpriteAnimation> get npcDeath => SpriteAnimation.load(
        'ghost_.png',
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.18,
            textureSize: Vector2(24, 24),
            texturePosition: Vector2(96, 120)),
      );
}
