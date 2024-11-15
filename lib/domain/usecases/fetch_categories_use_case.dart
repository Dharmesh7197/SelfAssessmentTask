import 'package:self_assesment_task/core/network/api_url.dart';
import 'package:self_assesment_task/domain/entities/category_entity.dart';
import 'package:self_assesment_task/domain/repositories/self_assesment_repository.dart';

class FetchCategoriesUseCase {
  final SelfAssesmentRepository selfAssesmentRepository;

  FetchCategoriesUseCase(this.selfAssesmentRepository);

  Future<List<CategoryEntity>> call() async {
    return await selfAssesmentRepository.fetchCategories(ApiUrl.categories);
  }
}