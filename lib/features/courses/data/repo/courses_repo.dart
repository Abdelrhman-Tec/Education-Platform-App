import 'package:education_platform_app/core/errors/api_error_handler.dart';
import 'package:education_platform_app/core/networking/api_services.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/core/networking/api_result.dart';

class CoursesRepo {
  final ApiService apiService;
  CoursesRepo(this.apiService);

  Future<ApiResult<List<CoursesResponseModel>>> getCourses() async {
    try {
      final response = await apiService.getCourses();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CoursesResponseModel>>> searchCourses(
    String query,
  ) async {
    try {
      final response = await apiService.searchCourses(query);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
