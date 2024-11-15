import 'package:self_assesment_task/core/models/server_response.dart';
import 'package:self_assesment_task/domain/entities/profile_entity.dart';
import 'package:self_assesment_task/domain/entities/top_pick_entity.dart';

class TopPickModel extends TopPickEntity {
  TopPickModel({
    required super.icon,
    required super.testName,
    required super.description,
    required super.testTime,
  });

  factory TopPickModel.fromJson(Map<String, dynamic> json) {
    return TopPickModel(
      icon: json['icon'] ?? "",
      testName: json['testName'] ?? "",
      description: json['description'] ?? "",
      testTime: json['testTime'] ?? "",
    );
  }
}