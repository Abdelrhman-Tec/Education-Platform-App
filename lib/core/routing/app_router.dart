import 'package:education_platform_app/core/di/service_locator.dart';
import 'package:education_platform_app/features/categories/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/sign_in/presentation/screens/login_screen.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:education_platform_app/features/sign_up/presentation/sign_up_cubit/cubit/register_cubit.dart';
import 'package:education_platform_app/features/sign_up/presentation/screens/register_screen.dart';
import 'package:education_platform_app/main_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.register:
        return _buildCupertinoRoute(
          BlocProvider(
            create: (_) => getIt<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.login:
        return _buildCupertinoRoute(
          BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.mainScreen:
        return _buildCupertinoRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<CategoriesCubit>()),
              BlocProvider(create: (_) => getIt<CoursesCubit>()),
            ],
            child: MainScreen(),
          ),
        );

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
