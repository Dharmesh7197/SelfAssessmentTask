import 'package:self_assesment_task/domain/entities/category_entity.dart';
import 'package:self_assesment_task/domain/entities/profile_entity.dart';
import 'package:self_assesment_task/domain/entities/recent_test_entity.dart';
import 'package:self_assesment_task/domain/entities/top_pick_entity.dart';

abstract class SelfAssesmentState {}

class SelfAssesmentLoading extends SelfAssesmentState {}

class SelfAssesmentLoaded extends SelfAssesmentState {
  final ProfileEntity? profile;
  final List<CategoryEntity> categories;
  final List<TopPickEntity> topPicks;
  final List<RecentTestEntity> recentTests;

  SelfAssesmentLoaded({this.profile, required this.categories, required this.topPicks, required this.recentTests});
}

class SelfAssesmentError extends SelfAssesmentState {
  final String message;

  SelfAssesmentError(this.message);
}