import 'package:education_platform_app/core/errors/api_error_handler.dart';
import 'package:education_platform_app/core/networking/api_result.dart';
import 'package:education_platform_app/core/networking/api_services.dart';
import 'package:education_platform_app/features/sign_in/data/model/login_request_model.dart';
import 'package:education_platform_app/features/sign_in/data/model/login_response_model.dart';

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

  Future<ApiResult<String>> logout({required String token}) async {
    try {
      final response = await apiService.logout('Bearer $token');
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
