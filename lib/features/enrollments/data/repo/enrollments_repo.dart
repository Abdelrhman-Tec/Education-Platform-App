import 'package:education_platform_app/features/enrollments/data/model/enrollments_request_model.dart';
import 'package:education_platform_app/features/enrollments/data/model/enrollments_response_model.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';

class EnrollmentsRepo {
  final ApiService apiService;
  EnrollmentsRepo(this.apiService );

  Future<ApiResult<EnrollmentsResponseModel>> enroll(
    EnrollmentsRequestModel request,
  ) async {
    try {
      final response = await apiService.enroll(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
