import 'package:self_assesment_task/data/data_sources/self_assesment_service.dart';
import 'package:self_assesment_task/domain/entities/category_entity.dart';
import 'package:self_assesment_task/domain/entities/profile_entity.dart';
import 'package:self_assesment_task/domain/entities/recent_test_entity.dart';
import 'package:self_assesment_task/domain/entities/top_pick_entity.dart';
import 'package:self_assesment_task/domain/repositories/self_assesment_repository.dart';

class SelfAssesmentRepositoryImpl implements SelfAssesmentRepository {
  final SelfAssesmentService selfAssesmentService;

  SelfAssesmentRepositoryImpl(this.selfAssesmentService);

  @override
  Future<ProfileEntity?> fetchProfile(String url) async => await selfAssesmentService.getProfile(url);

  @override
  Future<List<CategoryEntity>> fetchCategories(String url) async => await selfAssesmentService.getCategories(url);

  @override
  Future<List<TopPickEntity>> fetchTopPicks(String url) async => await selfAssesmentService.getTopPicks(url);

  @override
  Future<List<RecentTestEntity>> fetchRecentTests(String url) async => await selfAssesmentService.getRecentTests(url);
}