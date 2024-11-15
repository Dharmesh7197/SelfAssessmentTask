import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_assesment_task/core/utility/pref_helper.dart';
import 'package:self_assesment_task/data/data_sources/self_assesment_service.dart';
import 'package:self_assesment_task/data/repositories/self_assesment_repository_impl.dart';
import 'package:self_assesment_task/domain/useCases/fetch_categories_use_case.dart';
import 'package:self_assesment_task/domain/useCases/fetch_profile_use_case.dart';
import 'package:self_assesment_task/domain/useCases/fetch_recent_tests_use_case.dart';
import 'package:self_assesment_task/domain/useCases/fetch_top_pick_use_case.dart';
import 'package:self_assesment_task/presentation/self_assement/bloc/self_assesment_bloc.dart';
import 'package:self_assesment_task/presentation/self_assement/bloc/self_assesment_event.dart';
import 'package:self_assesment_task/presentation/self_assement/view/self_assesment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize service
    final selfAssesmentService = SelfAssesmentService();
    // Initialize repository
    final selfAssesmentRepository = SelfAssesmentRepositoryImpl(selfAssesmentService);

    // Initialize Use Cases
    final fetchProfileUseCase = FetchProfileUseCase(selfAssesmentRepository);
    final fetchCategoriesUseCase = FetchCategoriesUseCase(selfAssesmentRepository);
    final fetchTopPicksUseCase = FetchTopPicksUseCase(selfAssesmentRepository);
    final fetchRecentTestsUseCase = FetchRecentTestsUseCase(selfAssesmentRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelfAssesmentBloc(
            fetchProfile: fetchProfileUseCase,
            fetchCategories: fetchCategoriesUseCase,
            fetchTopPicks: fetchTopPicksUseCase,
            fetchRecentTests: fetchRecentTestsUseCase,
          )..add(FetchSelfAssesmentEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Self Assessment Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SelfAssesment(),
      ),
    );
  }
}
