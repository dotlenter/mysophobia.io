import 'package:auto_route/auto_route_annotations.dart';

import '../../app/presentation/pages/navigation/navigation_page.dart';
import '../../app/presentation/pages/splash/splash_page.dart';
import '../../app/presentation/pages/game_shooter/game_shooter.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: NavigationPage),
  MaterialRoute(page: GameShooter),
])
class $Router {}
