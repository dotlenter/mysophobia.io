import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/plugins/responsive_size_util/responsive_size_util.dart';
import '../../../../core/routes/router.gr.dart';

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
    return Splash();
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveSizeUtil.instance =
        ResponsiveSizeUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/myso.png'),
            width: 110,
            height: 110,
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontFamily: 'BJohn',
                fontSize: 26,
                color: Colors.black54,
              ),
              children: [
                const TextSpan(text: 'Mysophobia'),
                const TextSpan(
                  text: '.',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'IO',
                  style: TextStyle(color: Colors.green[300]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
