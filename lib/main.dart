import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'app_widget.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  runApp(App());
}
