import 'package:education_platform_app/core/di/service_locator.dart';
import 'package:education_platform_app/features/auth/presentation/screens/login_screen.dart';
import 'package:education_platform_app/features/auth/presentation/widgets/auth_imports.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
        // return _buildCupertinoRoute(const RegisterScreen());
        break;

      case Routes.login:
        return _buildCupertinoRoute(
          BlocProvider(
            create: (_) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );

      default:
        return _buildCupertinoRoute(const NotFoundPage());
    }
    // Fallback to ensure a non-null Route is always returned
    return _buildCupertinoRoute(const NotFoundPage());
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
