abstract class LevelStatus {
  const LevelStatus();
}

class InitialGameStatus extends LevelStatus {
  const InitialGameStatus();
}

class LevelLoading extends LevelStatus {}

class LevelLoaded extends LevelStatus {}

class LevelEnd extends LevelStatus {}
