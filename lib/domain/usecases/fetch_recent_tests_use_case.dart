import 'package:self_assesment_task/core/network/api_url.dart';
import 'package:self_assesment_task/domain/entities/recent_test_entity.dart';
import 'package:self_assesment_task/domain/repositories/self_assesment_repository.dart';

class FetchRecentTestsUseCase {
  final SelfAssesmentRepository selfAssesmentRepository;

  FetchRecentTestsUseCase(this.selfAssesmentRepository);

  Future<List<RecentTestEntity>> call() async {
    return await selfAssesmentRepository.fetchRecentTests(ApiUrl.recentTakenTests);
  }
}