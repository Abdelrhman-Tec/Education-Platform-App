import 'package:education_platform_app/core/networking/api_result.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/my_courses/data/model/my_course_response_model.dart';
import 'package:education_platform_app/features/my_courses/data/repo/my_course_repo.dart';
import 'package:education_platform_app/features/sign_up/data/model/register_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_course_state.dart';
part 'my_course_cubit.freezed.dart';

class MyCourseCubit extends Cubit<MyCourseState<List<MyCoursesResponseModel>>> {
  final MyCourseRepo myCourseRepo;
  MyCourseCubit(this.myCourseRepo) : super(MyCourseState.initial());

  Future<void> getMyCourses() async {
    emit(const MyCourseState.loading());

    try {
      final userJson = SharedPrefsService.getString('user');
      if (userJson == null) {
        emit(
          const MyCourseState.failure(message: 'You must be logged in first'),
        );
        return;
      }

      final user = User.fromJson(jsonDecode(userJson)['user']);
      if (user.id == null) {
        emit(const MyCourseState.failure(message: 'User data is invalid'));
        return;
      }

      final response = await myCourseRepo.getMyCourses(user.id!);
      response.when(
        success: (myCourses) => emit(MyCourseState.success(myCourses)),
        failure: (error) => emit(
          MyCourseState.failure(
            message: error.apiErrorModel.message ?? 'Error loading my courses',
          ),
        ),
      );
    } catch (e) {
      emit(
        const MyCourseState.failure(
          message: 'Unexpected error, please try again',
        ),
      );
    }
  }
}
