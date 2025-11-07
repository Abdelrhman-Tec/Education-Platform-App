import 'package:dio/dio.dart';
import 'package:education_platform_app/core/networking/api_services.dart';
import 'package:education_platform_app/core/networking/dio_factory.dart';
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
}
