import 'dart:async';

//khai bao cho ex4
class Car {
  String brand;
  Car(this.brand);
  Car.named(this.brand);
  void drive() {
    print("Xe $brand đang chay...");
  }
}

class ElectricCar extends Car {
  double batteryLevel;
  ElectricCar(String brand, this.batteryLevel) : super(brand);
  @override
  void drive() {
    print("Xe dien $brand đang chay voi muc pin con $batteryLevel%...");
  }
}

void main() async {
  print("exercise 1");
  int age = 20;
  double score = 9.0;
  String name = "Nguyen Van A";
  bool isStudent = false;
  print("Name: $name");
  print("Age: $age - Score: $score");
  print("Status: ${isStudent ? 'isActive' : 'notActive'}");

  print("\nexercise 2");
  List<int> nums = [1, 2, 3, 4, 5];
  nums.add(6);
  Set<String> colors = {"Red", "Blue", "Green", "Red"};
  Map<String, String> capital = {
    "Vietnam": "Hanoi",
    "Japan": "Tokyo",
    "Germany": "Berlin",
  };
  print("List numbers: $nums");
  print("List colors: $colors");
  print("Thu do cua Vietnam: ${capital['Vietnam']}");

  print("\nexercise 3");
  //if else
  if (score >= 8.0) {
    print("Sinh vien Gioi");
  } else {
    print("Sinh vien Kha");
  }
  //switch case cho day of week
  int day = 4;
  String dayName;

  switch (day) {
    case 1:
      dayName = "Chu nhat";
      break;
    case 2:
      dayName = "Thu 2";
      break;
    case 3:
      dayName = "Thu 3";
      break;
    case 4:
      dayName = "Thu 4";
      break;
    case 5:
      dayName = "Thu 5";
      break;
    case 6:
      dayName = "Thu 6";
      break;
    case 7:
      dayName = "Thu 7";
      break;
    default:
      dayName = "Ngay khong hop le (1-7)";
  }
  print("Hom nay la: $dayName");

  //loops (3 yc for, forin, forEach)
  List<String> fruits = ["Cam", "Quyt", "Mit", "Dua"];
  //for
  print("for loop:");
  for (int i = 0; i < fruits.length; i++) {
    print("Vi tri $i: ${fruits[i]}");
  }
  //forin
  print("\nforin loop:");
  for (var fruit in fruits) {
    print("Qua: $fruit");
  }
  //forEach
  print("\nforEach loop:");
  fruits.forEach((fruit) => print("forEach: $fruit"));

  //normal func
  double calculateAreaNormal(double width, double height) {
    return width * height;
  }

  //arrow function
  double calculateAreaArrow(double width, double height) => width * height;
  print("Dien tich (Normal): ${calculateAreaNormal(5, 10)}");
  print("Dien tich (Arrow): ${calculateAreaArrow(5, 10)}");

  print("\nexercise 4");
  Car myCar = Car("Toyota");
  myCar.drive();

  ElectricCar myTesla = ElectricCar("Tesla", 90.5);
  myTesla.drive();

  print("\nexercise 5");
  //null safety
  practiceNullSafety();

  //async - await future
  print("Dang tai du lieu...");
  await fetchData();

  //Stream
  print("Bat dau Stream so:");
  Stream<int> countStream = countNumbers(3);
  await for (int val in countStream) {
    print("Stream value: $val");
  }
}

//ham gia lap async cho ex5
Future<void> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  print("Du lieu da duoc tai xong sau 1s");
}

//ham tao stream cho ex5
Stream<int> countNumbers(int max) async* {
  for (int i = 1; i <= max; i++) {
    yield i;
  }
}

void practiceNullSafety() {
  String? nullableName; // '?': bien nay co the chua gia tri null
  //toan tu '??': cung cap gia tri mac dinh neu bien la null
  String displayName = nullableName ?? "Nguoi dung an danh";
  print("Ten hien thi: $displayName");

  nullableName = "newbie";

  //toan tu '!'
  if (nullableName != null) {
    print("Do dai ten (dung !): ${nullableName!.length}");
  }
  print("Viet hoa ten (dung ?.): ${nullableName?.toUpperCase()}");
}
