import 'dart:developer';

import 'package:education_platform_app/core/cache/shared_prefs_service.dart';
import 'package:education_platform_app/core/routing/routes.dart';

String getInitialRouteBasedOnLogin() {
  final token = SharedPrefsService.getString('token');
  if (token != null && token.isNotEmpty) {
    log('token: $token');
    return Routes.mainScreen;
  } else {
    return Routes.login;
  }
}
