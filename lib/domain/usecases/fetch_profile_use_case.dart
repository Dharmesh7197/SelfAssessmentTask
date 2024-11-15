import 'package:self_assesment_task/core/network/api_url.dart';
import 'package:self_assesment_task/domain/entities/profile_entity.dart';
import 'package:self_assesment_task/domain/repositories/self_assesment_repository.dart';

class FetchProfileUseCase {
  final SelfAssesmentRepository selfAssesmentRepository;

  FetchProfileUseCase(this.selfAssesmentRepository);

  Future<ProfileEntity?> call() async {
    return await selfAssesmentRepository.fetchProfile(ApiUrl.profile);
  }
}