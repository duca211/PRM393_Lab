void main() async {
  print("\nExercise 4");

  final numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  final transformedStream = numberStream
      .map((n) => n * n)
      .where((n) => n % 2 == 0);

  print("Ket qua chuyen doi (sau khi binh phuong chung, lay so chan):");
  await for (var value in transformedStream) {
    print(value);
  }
}
