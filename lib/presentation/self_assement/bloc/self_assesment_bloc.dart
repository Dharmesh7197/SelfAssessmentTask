import 'package:self_assesment_task/domain/useCases/fetch_categories_use_case.dart';
import 'package:self_assesment_task/domain/useCases/fetch_profile_use_case.dart';
import 'package:self_assesment_task/domain/useCases/fetch_recent_tests_use_case.dart';
import 'package:self_assesment_task/domain/useCases/fetch_top_pick_use_case.dart';
import 'package:self_assesment_task/presentation/self_assement/bloc/self_assesment_event.dart';
import 'package:self_assesment_task/presentation/self_assement/bloc/self_assesment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelfAssesmentBloc extends Bloc<SelfAssesmentEvent, SelfAssesmentState> {
  final FetchProfileUseCase fetchProfile;
  final FetchCategoriesUseCase fetchCategories;
  final FetchTopPicksUseCase fetchTopPicks;
  final FetchRecentTestsUseCase fetchRecentTests;

  SelfAssesmentBloc({
    required this.fetchProfile,
    required this.fetchCategories,
    required this.fetchTopPicks,
    required this.fetchRecentTests,
  }) : super(SelfAssesmentLoading()) {
    on<FetchSelfAssesmentEvent>((event, emit) async {
      emit(SelfAssesmentLoading());
      try {
        final profile = await fetchProfile();
        final categories = await fetchCategories();
        final topPicks = await fetchTopPicks();
        final recentTests = await fetchRecentTests();

        emit(SelfAssesmentLoaded(
          profile: profile,
          categories: categories,
          topPicks: topPicks,
          recentTests: recentTests,
        ));
      } catch (e) {
        emit(SelfAssesmentError(e.toString()));
      }
    });
  }
}
