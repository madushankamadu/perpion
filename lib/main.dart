import 'dart:async';

import 'package:demo_app/routes/routes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
  initialRoute: '/dashboard_1_page',
      routes: routes,
    ),
  );
}
