// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/presentation/pages/game_shooter/game_shooter.dart';
import '../../app/presentation/pages/navigation/navigation_page.dart';
import '../../app/presentation/pages/splash/splash_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String navigationPage = '/navigation-page';
  static const String gameShooter = '/game-shooter';
  static const all = <String>{
    splashPage,
    navigationPage,
    gameShooter,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.navigationPage, page: NavigationPage),
    RouteDef(Routes.gameShooter, page: GameShooter),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(),
        settings: data,
      );
    },
    NavigationPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NavigationPage(),
        settings: data,
      );
    },
    GameShooter: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GameShooter(),
        settings: data,
      );
    },
  };
}
