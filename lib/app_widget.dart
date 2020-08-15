import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'core/routes/router.gr.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator(router: Router()),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.indigoAccent[300],
        accentColor: Colors.blueAccent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
