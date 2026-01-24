import 'dart:async';

void main() {
  print("\nExercise 3");

  print("1. Start main");

  Future(() => print("4. Future (Event Queue)"));

  scheduleMicrotask(() {
    print("3. Microtask");
  });

  print("2. End main");
}
