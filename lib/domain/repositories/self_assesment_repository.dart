import 'package:self_assesment_task/domain/entities/category_entity.dart';
import 'package:self_assesment_task/domain/entities/profile_entity.dart';
import 'package:self_assesment_task/domain/entities/recent_test_entity.dart';
import 'package:self_assesment_task/domain/entities/top_pick_entity.dart';

abstract class SelfAssesmentRepository {
  Future<ProfileEntity?> fetchProfile(String url);
  Future<List<CategoryEntity>> fetchCategories(String url);
  Future<List<TopPickEntity>> fetchTopPicks(String url);
  Future<List<RecentTestEntity>> fetchRecentTests(String url);
}