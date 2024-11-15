import 'package:self_assesment_task/core/models/server_response.dart';
import 'package:self_assesment_task/domain/entities/category_entity.dart';
import 'package:self_assesment_task/domain/entities/profile_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.icon, required super.name, required super.numberOfQuizzes});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(icon: json['icon'] ?? "", name: json['name'] ?? "", numberOfQuizzes: json['numberOfQuizzes'] ?? 0);
  }
}
