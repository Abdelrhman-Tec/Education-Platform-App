import 'package:education_platform_app/features/my_courses/data/model/my_course_response_model.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';

class MyCourseRepo {
  final ApiService apiService;
  MyCourseRepo(this.apiService);

  Future<ApiResult<List<MyCoursesResponseModel>>> getMyCourses(userId) async {
    try {
      final response = await apiService.getMyCourses(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
