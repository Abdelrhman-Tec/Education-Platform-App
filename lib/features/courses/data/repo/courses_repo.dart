import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';

class CoursesRepo {
  final ApiService apiService;
  CoursesRepo(this.apiService);

  Future<ApiResult<List<Course>>> getCourses() async {
    try {
      final response = await apiService.getCourses();
      return ApiResult.success(response.data ?? []);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<Course>>> searchCourses(String query) async {
    try {
      final response = await apiService.searchCourses(query);
      return ApiResult.success(response.data ?? []);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
