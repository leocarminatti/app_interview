// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../app/presentation/pages/main_page.dart' as _i2;
import '../../app/presentation/pages/repositories_page.dart' as _i4;
import '../../app/presentation/pages/splash_page.dart' as _i1;
import '../../app/presentation/pages/user_page.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.MainPage(key: args.key));
    },
    UserRoute.name: (routeData) {
      final args = routeData.argsAs<UserRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.UserPage(key: args.key, userId: args.userId));
    },
    RepositoriesRoute.name: (routeData) {
      final args = routeData.argsAs<RepositoriesRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RepositoriesPage(key: args.key, userId: args.userId));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashRoute.name, path: '/'),
        _i5.RouteConfig(MainRoute.name, path: '/main-page'),
        _i5.RouteConfig(UserRoute.name, path: '/user-page'),
        _i5.RouteConfig(RepositoriesRoute.name, path: '/repositories-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i5.PageRouteInfo<MainRouteArgs> {
  MainRoute({_i6.Key? key})
      : super(MainRoute.name,
            path: '/main-page', args: MainRouteArgs(key: key));

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.UserPage]
class UserRoute extends _i5.PageRouteInfo<UserRouteArgs> {
  UserRoute({_i6.Key? key, required String userId})
      : super(UserRoute.name,
            path: '/user-page', args: UserRouteArgs(key: key, userId: userId));

  static const String name = 'UserRoute';
}

class UserRouteArgs {
  const UserRouteArgs({this.key, required this.userId});

  final _i6.Key? key;

  final String userId;

  @override
  String toString() {
    return 'UserRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i4.RepositoriesPage]
class RepositoriesRoute extends _i5.PageRouteInfo<RepositoriesRouteArgs> {
  RepositoriesRoute({_i6.Key? key, required String userId})
      : super(RepositoriesRoute.name,
            path: '/repositories-page',
            args: RepositoriesRouteArgs(key: key, userId: userId));

  static const String name = 'RepositoriesRoute';
}

class RepositoriesRouteArgs {
  const RepositoriesRouteArgs({this.key, required this.userId});

  final _i6.Key? key;

  final String userId;

  @override
  String toString() {
    return 'RepositoriesRouteArgs{key: $key, userId: $userId}';
  }
}
