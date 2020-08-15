import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/plugins/responsive_size_util/responsive_size_util.dart';
import '../../../../core/routes/router.gr.dart';
import 'widgets/widgets.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => ExtendedNavigator.of(context)
            .pushAndRemoveUntil(Routes.navigationPage, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSizeUtil.instance =
        ResponsiveSizeUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Splash();
  }
}

