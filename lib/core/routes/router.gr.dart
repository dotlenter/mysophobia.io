// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/domain/entities/vaccines.dart';
import '../../app/presentation/pages/game_shooter/game_shooter.dart';
import '../../app/presentation/pages/navigation/navigation_page.dart';
import '../../app/presentation/pages/splash/splash_page.dart';
import '../../app/presentation/pages/vaccine/vaccine_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String navigationPage = '/navigation-page';
  static const String gameShooter = '/game-shooter';
  static const String vaccinePage = '/vaccine-page';
  static const all = <String>{
    splashPage,
    navigationPage,
    gameShooter,
    vaccinePage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.navigationPage, page: NavigationPage),
    RouteDef(Routes.gameShooter, page: GameShooter),
    RouteDef(Routes.vaccinePage, page: VaccinePage),
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
    VaccinePage: (data) {
      final args = data.getArgs<VaccinePageArguments>(
        orElse: () => VaccinePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => VaccinePage(
          key: args.key,
          vaccine: args.vaccine,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// VaccinePage arguments holder class
class VaccinePageArguments {
  final Key key;
  final Vaccine vaccine;
  VaccinePageArguments({this.key, this.vaccine});
}
