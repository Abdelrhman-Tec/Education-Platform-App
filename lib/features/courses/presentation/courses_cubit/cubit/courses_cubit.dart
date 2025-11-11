import 'package:bloc/bloc.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/courses/data/repo/courses_repo.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'courses_state.dart';
part 'courses_cubit.freezed.dart';

class CoursesCubit extends Cubit<CoursesState<List<CoursesResponseModel>>> {
  final CoursesRepo coursesRepo;

  CoursesCubit(this.coursesRepo) : super(const CoursesState.initial());

  Future<void> getCourses() async {
    emit(const CoursesState.loading());
    final response = await coursesRepo.getCourses();
    response.when(
      success: (courses) => emit(CoursesState.success(courses)),
      failure: (error) => emit(CoursesState.failure(error.toString())),
    );
  }

  Future<void> searchCourses(String query) async {
    if (query.trim().length < 2) return;
    emit(const CoursesState.loading());
    final response = await coursesRepo.searchCourses(query);
    response.when(
      success: (courses) => emit(CoursesState.success(courses)),
      failure: (error) => emit(CoursesState.failure(error.toString())),
    );
  }

  Future<void> getCoursesByCategory(int categoryId) async {
    emit(const CoursesState.loading());
    final response = await coursesRepo.getCourses();
    response.when(
      success: (courses) {
        final filteredCourses = courses
            .where((course) => course.categoryId == categoryId)
            .toList();

        emit(CoursesState.success(filteredCourses));
      },
      failure: (error) {
        emit(CoursesState.failure(error.toString()));
      },
    );
  }
}
