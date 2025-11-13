import 'package:education_platform_app/features/enrollments/data/model/enrollments_request_model.dart';
import 'package:education_platform_app/features/enrollments/data/model/enrollments_response_model.dart';
import 'package:education_platform_app/features/enrollments/data/model/unenroll_response_model.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';

class EnrollmentsRepo {
  final ApiService apiService;
  EnrollmentsRepo(this.apiService);

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

  Future<ApiResult<List<EnrollmentsResponseModel>>> getEnrollments({
    required int userId,
  }) async {
    try {
      final response = await apiService.getEnrollments(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UnenrollResponseModel>> unenroll({
    required int userId,
    required int courseId,
  }) async {
    try {
      final response = await apiService.unenroll(userId, courseId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
