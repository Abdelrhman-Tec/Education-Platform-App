import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';
import 'package:education_platform_app/features/sign_up/data/model/register_request_model.dart';
import 'package:education_platform_app/features/sign_up/data/model/register_response_model.dart';

class RegisterRepo {
  final ApiService apiService;
  RegisterRepo({required this.apiService});

  Future<ApiResult<RegisterResponseModel>> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    try {
      final response = await apiService.register(registerRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
