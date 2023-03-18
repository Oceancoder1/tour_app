// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final bool isTop;

  const User({
    required this.id,
    required this.name,
    required this.isTop,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isTop,
      ];

  User copyWith({
    int? id,
    String? name,
    bool? isTop,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      isTop: isTop ?? this.isTop,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, isTop: $isTop)';
  }

  static const List<User> users = [
    User(id: 1, name: "John Doe", isTop: true),
    User(id: 2, name: "Jane Smith", isTop: false),
    User(id: 3, name: "Bob Johnson", isTop: true),
    User(id: 4, name: "Alice Brown", isTop: false),
    User(id: 5, name: "David Lee", isTop: true),
    User(id: 6, name: "Emily Davis", isTop: false),
    User(id: 7, name: "Chris White", isTop: true),
    User(id: 8, name: "Karen Martinez", isTop: false),
    User(id: 9, name: "Mike Wilson", isTop: true),
    User(id: 10, name: "Sarah Kim", isTop: false),
  ];
}
