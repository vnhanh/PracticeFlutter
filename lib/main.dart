import 'package:demo_crypto_checker/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'features/dashboard/screens/dashboard_screen.dart';

Future<void> main() async {
  // await initGetIt();
  configureDependencies();
  runApp(const DashboardScreen());
}
