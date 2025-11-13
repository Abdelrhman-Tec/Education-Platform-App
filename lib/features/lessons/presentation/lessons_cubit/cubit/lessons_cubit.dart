import 'package:education_platform_app/core/networking/api_result.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/lessons/data/repo/lessons_repo.dart';
import 'package:education_platform_app/features/sign_up/data/model/register_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lessons_state.dart';
part 'lessons_cubit.freezed.dart';

class LessonsCubit extends Cubit<LessonsState> {
  final LessonsRepo lessonsRepo;

  LessonsCubit(this.lessonsRepo) : super(const LessonsState.initial());

  Future<void> getCourseLessons({required int courseId}) async {
    emit(const LessonsState.loading());

    try {
      final userJson = SharedPrefsService.getString('user');
      if (userJson == null) {
        emit(const LessonsState.error(message: "User not found in cache"));
        return;
      }

      final userMap = jsonDecode(userJson)['user'];
      final user = User.fromJson(userMap);
      final userId = user.id;

      final result = await lessonsRepo.getCourseLessons(
        courseId: courseId,
        userId: userId!,
      );

      result.when(
        success: (lessons) => emit(LessonsState.success(lessons.lessons)),
        failure: (error) => emit(
          LessonsState.error(message: error.apiErrorModel.message.toString()),
        ),
      );
    } catch (e) {
      emit(LessonsState.error(message: e.toString()));
    }
  }
}
