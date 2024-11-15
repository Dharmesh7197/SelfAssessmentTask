import 'package:self_assesment_task/core/network/api_url.dart';
import 'package:self_assesment_task/domain/entities/top_pick_entity.dart';
import 'package:self_assesment_task/domain/repositories/self_assesment_repository.dart';

class FetchTopPicksUseCase {
  final SelfAssesmentRepository selfAssesmentRepository;

  FetchTopPicksUseCase(this.selfAssesmentRepository);

  Future<List<TopPickEntity>> call() async {
    return await selfAssesmentRepository.fetchTopPicks(ApiUrl.topPicks);
  }
}