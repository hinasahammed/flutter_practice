// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String age;
  final String classN;
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.age,
    required this.classN,
    required this.email,
    required this.password,
  });

  UserModel copyWith({
    String? name,
    String? age,
    String? classN,
    String? email,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
      classN: classN ?? this.classN,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'classN': classN,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      age: map['age'] as String,
      classN: map['classN'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, age: $age, classN: $classN, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.age == age &&
      other.classN == classN &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      age.hashCode ^
      classN.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}
