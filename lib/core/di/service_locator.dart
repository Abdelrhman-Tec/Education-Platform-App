import 'package:dio/dio.dart';
import 'package:education_platform_app/core/networking/api_services.dart';
import 'package:education_platform_app/core/networking/dio_factory.dart';
import 'package:education_platform_app/features/categories/data/repo/categories_repo.dart';
import 'package:education_platform_app/features/categories/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:education_platform_app/features/courses/data/repo/courses_repo.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/sign_in/data/repo/login_repo.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:education_platform_app/features/sign_up/data/repo/register_repo.dart';
import 'package:education_platform_app/features/sign_up/presentation/sign_up_cubit/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  Dio dio = await DioFactory.getDio();
  getIt.registerFactory<Dio>(() => dio);

  // ApiServices
  getIt.registerFactory<ApiService>(() => ApiService(getIt<Dio>()));

  // LoginRepositories
  getIt.registerFactory<LoginRepo>(
    () => LoginRepo(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  getIt.registerFactory<RegisterRepo>(
    () => RegisterRepo(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(getIt<RegisterRepo>()),
  );
  getIt.registerFactory<CategoriesRepo>(
    () => CategoriesRepo(getIt<ApiService>()),
  );

  getIt.registerFactory<CategoriesCubit>(
    () => CategoriesCubit(getIt<CategoriesRepo>()),
  );

  getIt.registerFactory<CoursesRepo>(() => CoursesRepo(getIt<ApiService>()));

  getIt.registerFactory<CoursesCubit>(() => CoursesCubit(getIt<CoursesRepo>()));
}
