import 'package:education_platform_app/features/auth/data/repo/auth_import_repo.dart';

class LoginRepo {
  final ApiService apiService;
  LoginRepo({required this.apiService});

  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await apiService.login(loginRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
