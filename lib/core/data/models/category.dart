import 'package:personal_reviews/core/interfaces/db_model.dart';

class Category implements DbModel<Category> {
  final int id;
  final String name;
  final String color;
  final String icon;

  const Category({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });

  @override
  factory Category.fromJson(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      color: map['color'],
      icon: map['icon'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'color': color,
      'icon': icon,
    };
  }
}