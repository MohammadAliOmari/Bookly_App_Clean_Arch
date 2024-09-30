import 'package:bookly/core/utils/dependency_injection/locater.dart';

import 'package:bookly/features/home/data/repositories/home_repositories_impl.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/home_cubit.dart';

import 'package:bookly/features/home/presentation/views/widgets/home_view_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        FetchFeaturedBooksUseCase(
          getIt.get<HomeRepositoriesImpl>(),
        ),
        FetchNewestBooksUseCase(
          getIt.get<HomeRepositoriesImpl>(),
        ),
      )
        ..fetcheFeatureBooks()
        ..fetcheNewestBooks(),
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
