import 'package:education_platform_app/app.dart';
import 'package:education_platform_app/core/cache/shared_prefs_service.dart';
import 'package:education_platform_app/core/config/logger.dart';
import 'package:education_platform_app/core/di/service_locator.dart';
import 'package:education_platform_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupGetIt();
  await SharedPrefsService.init();
  Log.demo();
  final initialRoute = checkUserLogin();
  runApp(EducationPlatformApp(initialRoute: initialRoute));
}

String checkUserLogin() {
  final token = SharedPrefsService.getString('token');
  if (token != null && token.isNotEmpty) {
    return Routes.mainScreen;
  } else {
    return Routes.login;
  }
}
