import 'dart:convert';

class student {
  int id;
  String first_name;
  String last_name;
  String email;
  String password;
  int age;
  String city;
  student({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.age,
    required this.city,
  });

  student copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? email,
    String? password,
    int? age,
    String? city,
  }) {
    return student(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      password: password ?? this.password,
      age: age ?? this.age,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'password': password,
      'age': age,
      'city': city,
    };
  }

  factory student.fromMap(Map<String, dynamic> map) {
    return student(
      id: map['id']?.toInt() ?? 0,
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      age: map['age']?.toInt() ?? 0,
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory student.fromJson(String source) =>
      student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'student(id: $id, first_name: $first_name, last_name: $last_name, email: $email, password: $password, age: $age, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is student &&
        other.id == id &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.email == email &&
        other.password == password &&
        other.age == age &&
        other.city == city;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        age.hashCode ^
        city.hashCode;
  }
}
