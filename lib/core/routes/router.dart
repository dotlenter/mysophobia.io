import 'package:auto_route/auto_route_annotations.dart';
import 'package:mysophobia_io/app/presentation/pages/navigation/navigation_page.dart';
import 'package:mysophobia_io/app/presentation/pages/splash/splash_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashPage, initial: true),
  MaterialRoute(page: NavigationPage)
])
class $Router {}
