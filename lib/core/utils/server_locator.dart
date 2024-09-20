import 'package:bookly/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly/Features/search/presentation/data/repos/search_repo_implement.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServerLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(getIt.get<ApiService>()));

  getIt.registerSingleton<SearchRepoImplement>(
      SearchRepoImplement(ApiService(Dio())));
}
