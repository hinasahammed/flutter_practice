// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmployeeModel {
  final String name;
  final String posi;
  final String salary;
  final String dep;

  EmployeeModel({
    required this.name,
    required this.posi,
    required this.salary,
    required this.dep,
  });

  EmployeeModel copyWith({
    String? name,
    String? posi,
    String? salary,
    String? dep,
  }) {
    return EmployeeModel(
      name: name ?? this.name,
      posi: posi ?? this.posi,
      salary: salary ?? this.salary,
      dep: dep ?? this.dep,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'posi': posi,
      'salary': salary,
      'dep': dep,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      name: map['name'] as String,
      posi: map['posi'] as String,
      salary: map['salary'] as String,
      dep: map['dep'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeModel.fromJson(String source) =>
      EmployeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmployeeModel(name: $name, posi: $posi, salary: $salary, dep: $dep)';
  }

  @override
  bool operator ==(covariant EmployeeModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.posi == posi &&
        other.salary == salary &&
        other.dep == dep;
  }

  @override
  int get hashCode {
    return name.hashCode ^ posi.hashCode ^ salary.hashCode ^ dep.hashCode;
  }
}
