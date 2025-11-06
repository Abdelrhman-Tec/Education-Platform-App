import 'package:education_platform_app/core/routing/routes.dart';
import 'package:education_platform_app/features/auth/presentation/screens/login_screen.dart';
import 'package:education_platform_app/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// AppRouter manages navigation logic and route generation
class AppRouter {
  /// Handles route generation based on route names
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
        return _buildCupertinoRoute(const RegisterScreen());

      case Routes.login:
        return _buildCupertinoRoute(const LoginScreen());

      default:
        return _buildCupertinoRoute(const NotFoundPage());
    }
  }

  static CupertinoPageRoute _buildCupertinoRoute(Widget page) {
    return CupertinoPageRoute(builder: (_) => page);
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          '404 - Page Not Found',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
