import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repositories/home_repositories_impl.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocater() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(Dio()),
  );
  getIt.registerSingleton<HomeRepositoriesImpl>(
    HomeRepositoriesImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiServices>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
}
