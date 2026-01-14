import 'dart:math';

class ExamTest {
  static void Print() {
    print("Hello");
    print('Every one');
    print('''Hello
    every one''');
  }

  static List<int> genRandom(int n) {
    List<int> nums = [];
    for (int i = 0; i < n; i++) {
      nums.add(Random().nextInt(100));
    }
    return nums;
  }

  static int CountNum({List<int> nums = const [1, 2], int searchValue = 0}) {
    //neu dung required List<int> nums thi khong can gan gia tri
    // int count = 0;
    // for (int i = 0; i < nums.length; i++) {
    //   if (nums[i] == x) {
    //     return count++;
    //   }
    // }
    // return count;
    return nums.where((a) => a == searchValue).length;
  }

  static Map<int, int> Count(List<int> nums) {
    Map<int, int> c = {};
    for (int x in nums) {
      if (c.containsKey(x)) {
        c[x] = c[x]! + 1;
      } else
        c[x] = 1;
    }
    return c;
  }
}
