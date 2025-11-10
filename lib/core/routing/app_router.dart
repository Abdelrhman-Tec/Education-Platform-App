import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/categories/data/model/categories_response_model.dart';
import 'package:education_platform_app/features/categories/presentation/screens/category_screen.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/courses/presentation/screens/course_details_screen.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';
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
        final userJson = SharedPrefsService.getString('user');
        LoginResponseModel? loginResponse;

        if (settings.arguments != null &&
            settings.arguments is LoginResponseModel) {
          loginResponse = settings.arguments as LoginResponseModel;
        } else if (userJson != null && userJson.isNotEmpty) {
          loginResponse = LoginResponseModel.fromJson(jsonDecode(userJson));
        }

        final name = loginResponse?.user?.firstName ?? 'Guest';

        return _buildCupertinoRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<CategoriesCubit>()),
              BlocProvider(create: (_) => getIt<CoursesCubit>()),
            ],
            child: MainScreen(name: name),
          ),
        );
      case Routes.categoryScreen:
        final categories = settings.arguments as Category;
        return _buildCupertinoRoute(
          BlocProvider(
            create: (_) => getIt<CoursesCubit>(),
            child: CategoryScreen(
              title: categories.name ?? '',
              coursesId: categories.id ?? 0,
            ),
          ),
        );

      case Routes.courseDetailsScreen:
        final course = settings.arguments as Course;
        return _buildCupertinoRoute(CourseDetailsScreen(courses: course));

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
