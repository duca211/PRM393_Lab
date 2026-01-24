class Settings {
  static Settings? _instance;

  Settings._internal();

  factory Settings() {
    _instance ??= Settings._internal();
    return _instance!;
  }
}

void main() {
  print("\nExercise 5");

  final s1 = Settings();
  final s2 = Settings();

  print("Is s1 identical to s2? ${identical(s1, s2)}");

  if (identical(s1, s2)) {
    print("true");
  }
}
