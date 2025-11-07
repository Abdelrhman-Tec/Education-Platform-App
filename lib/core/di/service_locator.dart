import 'package:dio/dio.dart';
import 'package:education_platform_app/core/networking/dio_factory.dart';
import 'package:education_platform_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:education_platform_app/features/auth/presentation/cubit/cubit_import.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // ApiServices
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // LoginRepositories
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt<LoginRepo>()));
}
