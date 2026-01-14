import 'dart:ui';

class Person {
  void Print() {
    print("Day la interface");
  }
}

class Student implements Person {
  final String id;
  final String name;
  final double math;
  final double phic;
  final double chem;
  Student({
    required this.id,
    required this.name,
    this.math = 0,
    this.phic = 0,
    this.chem = 0,
  });
  Student copyWith({
    String? id,
    String? name,
    double? math,
    double? phic,
    double? chem,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      math: math ?? this.math,
      phic: phic ?? this.phic,
      chem: chem ?? this.chem,
    );
  }

  void Print() {
    print("id: $id, name: $name,");
  }

  // String? _id;
  // String? _name;
  // double? _math;
  // double? _phic;
  // double? _chem;
  /*
  Student({
    String? id,
    String? name,
    double math = 0,
    double phic = 0,
    double chem = 0,
  }) {
    this._id = id;
    this._name = name;
    this._math = math;
    this._chem = chem;
    this._phic = phic;
  }
  String? get Name {
    return _name;
  }

  void set Name(String value) {
    _name = value!;
  }
  */

  /*
  //khai bao tuong ung voi Student(String _id) {this._id = id;}
  Student(this._id, this._name, {double? math, double? phic, double? chem}){
    this._math = math;
    this._phic = phic;
    this._chem = chem;
  }
  */
}
