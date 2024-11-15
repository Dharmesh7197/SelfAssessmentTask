import 'package:self_assesment_task/core/models/server_response.dart';

class ProfileEntity{
  final String userName;
  final String welcomeMessage;
  final String recentTestName;
  final int recentTestProgress;

  const ProfileEntity({required this.userName, required this.welcomeMessage, required this.recentTestName, required this.recentTestProgress});
}