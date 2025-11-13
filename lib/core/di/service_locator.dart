import 'package:dio/dio.dart';
import 'package:education_platform_app/core/networking/api_services.dart';
import 'package:education_platform_app/core/networking/dio_factory.dart';
import 'package:education_platform_app/features/cart/data/repo/cart_repo.dart';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';
import 'package:education_platform_app/features/categories/data/repo/categories_repo.dart';
import 'package:education_platform_app/features/categories/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:education_platform_app/features/courses/data/repo/courses_repo.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/enrollments/data/repo/enrollments_repo.dart';
import 'package:education_platform_app/features/enrollments/enrollments_cubit/cubit/enrollments_cubit.dart';
import 'package:education_platform_app/features/favorites/data/repo/favorites_repo.dart';
import 'package:education_platform_app/features/favorites/presentation/favorites_cubit/cubit/favorites_cubit.dart';
import 'package:education_platform_app/features/my_courses/data/repo/my_course_repo.dart';
import 'package:education_platform_app/features/my_courses/presentation/my_courses_cubit/cubit/my_course_cubit.dart';
import 'package:education_platform_app/features/sign_in/data/repo/login_repo.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:education_platform_app/features/sign_up/data/repo/register_repo.dart';
import 'package:education_platform_app/features/sign_up/presentation/sign_up_cubit/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // ApiServices
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // Repositories
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<RegisterRepo>(
    () => RegisterRepo(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CategoriesRepo>(
    () => CategoriesRepo(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CoursesRepo>(
    () => CoursesRepo(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt<ApiService>()));
  getIt.registerLazySingleton<MyCourseRepo>(
    () => MyCourseRepo(getIt<ApiService>()),
  );

  // Cubits
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepo>()),
  );
  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<CategoriesRepo>()),
  );
  getIt.registerFactory<CoursesCubit>(() => CoursesCubit(getIt<CoursesRepo>()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt<CartRepo>()));
  getIt.registerFactory<MyCourseCubit>(
    () => MyCourseCubit(getIt<MyCourseRepo>()),
  );

  getIt.registerFactory<EnrollmentsRepo>(
    () => EnrollmentsRepo(getIt<ApiService>()),
  );

  getIt.registerFactory<EnrollmentsCubit>(
    () => EnrollmentsCubit(getIt<EnrollmentsRepo>(), getIt<CartCubit>()),
  );


  getIt.registerFactory<FavoritesRepo>(
    () => FavoritesRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<FavoritesCubit>(
    () => FavoritesCubit(getIt<FavoritesRepo>()),
  );
}
