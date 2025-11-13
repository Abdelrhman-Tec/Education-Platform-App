import 'dart:developer';

import 'package:education_platform_app/features/enrollments/enrollments_cubit/cubit/enrollments_cubit.dart';
import 'package:education_platform_app/features/favorites/presentation/favorites_cubit/cubit/favorites_cubit.dart';
import 'package:education_platform_app/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:education_platform_app/features/lessons/data/model/lessons_response_model.dart';
import 'package:education_platform_app/features/lessons/presentation/lessons_cubit/cubit/lessons_cubit.dart';
import 'package:education_platform_app/features/lessons/presentation/screens/lesson_player.dart';
import 'package:education_platform_app/features/lessons/presentation/screens/lessons_screen.dart';
import 'package:education_platform_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';
import 'package:education_platform_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:education_platform_app/features/categories/data/model/categories_response_model.dart';
import 'package:education_platform_app/features/categories/presentation/screens/category_screen.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/courses/presentation/screens/course_details_screen.dart';
import 'package:education_platform_app/features/my_courses/presentation/my_courses_cubit/cubit/my_course_cubit.dart';
import 'package:education_platform_app/features/sign_in/data/model/login_response_model.dart';

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
              BlocProvider(create: (_) => getIt<CartCubit>()),
              BlocProvider(create: (_) => getIt<MyCourseCubit>()),
              BlocProvider(create: (_) => getIt<EnrollmentsCubit>()),
              BlocProvider(create: (_) => getIt<LoginCubit>()),
            ],
            child: MainScreen(name: name),
          ),
        );

      case Routes.categoryScreen:
        final category = settings.arguments as CategoriesResponseModel;
        return _buildCupertinoRoute(
          BlocProvider(
            create: (_) => getIt<CoursesCubit>(),
            child: CategoryScreen(
              title: category.name ?? '',
              coursesId: category.id ?? 0,
            ),
          ),
        );

      case Routes.courseDetailsScreen:
        final course = settings.arguments as CoursesResponseModel;
        return _buildCupertinoRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<CartCubit>()),
              BlocProvider(create: (_) => getIt<FavoritesCubit>()),
            ],
            child: CourseDetailsScreen(course: course),
          ),
        );

      case Routes.cartScreen:
        return _buildCupertinoRoute(
          BlocProvider(create: (_) => getIt<CartCubit>(), child: CartScreen()),
        );
      case Routes.profileScreen:
        return _buildCupertinoRoute(const ProfileScreen());

      case Routes.favorites:
        return _buildCupertinoRoute(
          BlocProvider(
            create: (_) => getIt<FavoritesCubit>(),
            child: FavoritesScreen(),
          ),
        );

      case Routes.lessonsScreen:
        final args = settings.arguments as Map<String, dynamic>?;
        if (args == null || args['id'] == null) {
          return _buildCupertinoRoute(
            Scaffold(body: Center(child: Text("Course data not found"))),
          );
        }

        final imageUrl = (args['image'] as String?) ?? '';

        return _buildCupertinoRoute(
          BlocProvider(
            create: (_) => getIt<LessonsCubit>(),
            child: LessonsScreen(
              courseId: args['id'] as int,
              imageUrl: imageUrl,
            ),
          ),
        );

      case Routes.lessonPlayer:
        final lesson = settings.arguments as Lesson;
        log(lesson.videoUrl);
        return _buildCupertinoRoute(
          LessonPlayer(videoUrl: lesson.videoUrl, title: lesson.title),
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
