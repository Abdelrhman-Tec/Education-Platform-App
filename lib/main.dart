import 'package:education_platform_app/app.dart';
import 'package:education_platform_app/core/cache/shared_prefs_service.dart';
import 'package:education_platform_app/core/config/logger.dart';
import 'package:education_platform_app/core/di/service_locator.dart';
import 'package:education_platform_app/core/function/get_initial_route_based_on_login.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await SharedPrefsService.init();
  Log.demo();
  final initialRoute = getInitialRouteBasedOnLogin();
  runApp(EducationPlatformApp(initialRoute: initialRoute));
}
