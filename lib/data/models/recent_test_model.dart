import 'package:self_assesment_task/core/models/server_response.dart';
import 'package:self_assesment_task/domain/entities/profile_entity.dart';
import 'package:self_assesment_task/domain/entities/recent_test_entity.dart';

class RecentTestModel extends RecentTestEntity {
  RecentTestModel({
    required super.icon,
    required super.name
  });

  factory RecentTestModel.fromJson(Map<String, dynamic> json) {
    return RecentTestModel(
      icon: json['icon'] ?? "",
      name: json['name'] ?? "",
    );
  }
}