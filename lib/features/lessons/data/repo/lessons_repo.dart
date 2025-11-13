import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/course_index.dart';
import 'package:education_platform_app/features/lessons/data/model/lessons_response_model.dart';

class LessonsRepo {
  final ApiService apiService;
  LessonsRepo(this.apiService);

  Future<ApiResult<LessonsResponseModel>> getCourseLessons({
    required int courseId,
    required int userId,
  }) async {
    try {
      final response = await apiService.getCourseLessons(courseId, userId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
