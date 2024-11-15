import 'package:self_assesment_task/core/models/server_response.dart';
import 'package:self_assesment_task/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.userName,
    required super.welcomeMessage,
    required super.recentTestName,
    required super.recentTestProgress,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userName: json['userName'] ?? "",
      welcomeMessage: json['welcomeMessage'] ?? "",
      recentTestName: json['recentTestName'] ?? "",
      recentTestProgress: json['recentTestProgress'] ?? 0.0,
    );
  }
}