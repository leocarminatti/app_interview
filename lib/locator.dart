import 'package:app_interview/app/data/data_sources/remote/github_api.dart';
import 'package:app_interview/app/data/repositories/github_repository.dart';
import 'package:app_interview/app/domain/usecases/get_random_users_use_case.dart';
import 'package:app_interview/app/domain/usecases/get_user_information_use_case.dart';
import 'package:app_interview/app/domain/usecases/get_user_repositories_use_case.dart';
import 'package:app_interview/app/presentation/stores/main_store.dart';
import 'package:app_interview/app/presentation/stores/repositories_store.dart';
import 'package:app_interview/app/presentation/stores/user_store.dart';
import 'package:app_interview/core/routes/app_router.gr.dart';
import 'package:get_it/get_it.dart';

GetIt getInstance = GetIt.instance;

Future setupLocator() async {
  ///DataSources
  getInstance.registerFactory<GitHubApi>(() => GitHubApi());

  ///Repositories
  getInstance
      .registerFactory<GithubRepository>(() => GithubRepository(getInstance()));

  ///UseCases
  getInstance.registerFactory<GetRandomUsersUseCase>(
      () => GetRandomUsersUseCase(getInstance()));

  getInstance.registerFactory<GetUserInformationUseCase>(
      () => GetUserInformationUseCase(getInstance()));

  getInstance.registerFactory<GetUserRepositoriesUseCase>(
      () => GetUserRepositoriesUseCase(getInstance()));

  ///Stores
  getInstance
      .registerSingleton<MainStore>(MainStore(getInstance(), getInstance()));

  getInstance.registerSingleton<UserStore>(UserStore(getInstance()));

  getInstance
      .registerSingleton<RepositoriesStore>(RepositoriesStore(getInstance()));

  ///Router
  getInstance.registerSingleton<AppRouter>(AppRouter());
}
