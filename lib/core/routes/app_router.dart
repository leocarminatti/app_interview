import 'package:app_interview/app/presentation/pages/main_page.dart';
import 'package:app_interview/app/presentation/pages/repositories_page.dart';
import 'package:app_interview/app/presentation/pages/splash_page.dart';
import 'package:app_interview/app/presentation/pages/user_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: MainPage),
    AutoRoute(page: UserPage),
    AutoRoute(page: RepositoriesPage),
  ],
)
class $AppRouter {}
