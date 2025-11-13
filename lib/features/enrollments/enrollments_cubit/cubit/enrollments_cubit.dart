import 'dart:convert';
import 'package:education_platform_app/export.dart';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/course_index.dart';
import 'package:education_platform_app/features/enrollments/data/model/enrollments_request_model.dart';
import 'package:education_platform_app/features/enrollments/data/repo/enrollments_repo.dart';
part 'enrollments_state.dart';
part 'enrollments_cubit.freezed.dart';

class EnrollmentsCubit extends Cubit<EnrollmentsState> {
  final EnrollmentsRepo enrollmentsRepo;
  final CartCubit cartCubit;

  EnrollmentsCubit(this.enrollmentsRepo, this.cartCubit)
    : super(EnrollmentsState.initial());

  Future<void> enrollCart(List<int> courseIds) async {
    emit(const EnrollmentsState.loading());

    final userJson = SharedPrefsService.getString('user');
    if (userJson == null) {
      emit(const EnrollmentsState.error('You must be logged in first'));
      return;
    }

    final user = User.fromJson(jsonDecode(userJson)['user']);
    if (user.id == null) {
      emit(const EnrollmentsState.error('User data is invalid'));
      return;
    }

    try {
      final response = await enrollmentsRepo.enroll(
        EnrollmentsRequestModel(userId: user.id!, courseIds: courseIds),
      );

      response.when(
        success: (enrollments) {
          emit(EnrollmentsState.success(enrollments));
        },
        failure: (error) {
          emit(
            EnrollmentsState.error(
              error.apiErrorModel.message ?? 'Enrollment failed',
            ),
          );
        },
      );
    } catch (e) {
      emit(const EnrollmentsState.error('Unexpected error'));
    }
  }

  Future<void> getEnrollments() async {
    emit(const EnrollmentsState.loading());
    final userJson = SharedPrefsService.getString('user');
    if (userJson == null) {
      emit(const EnrollmentsState.error('You must be logged in first'));
      return;
    }

    final user = User.fromJson(jsonDecode(userJson)['user']);
    if (user.id == null) {
      emit(const EnrollmentsState.error('User data is invalid'));
      return;
    }
    final response = await enrollmentsRepo.getEnrollments(userId: user.id!);
    response.when(
      success: (enrollments) => emit(EnrollmentsState.success(enrollments)),
      failure: (error) => emit(
        EnrollmentsState.error(
          error.apiErrorModel.message ?? 'Error loading enrollments',
        ),
      ),
    );
  }

  Future<void> unenroll(int courseId) async {
    emit(const EnrollmentsState.loading());
    final userJson = SharedPrefsService.getString('user');
    if (userJson == null) {
      emit(const EnrollmentsState.error('You must be logged in first'));
      return;
    }
    final user = User.fromJson(jsonDecode(userJson)['user']);
    if (user.id == null) {
      emit(const EnrollmentsState.error('User data is invalid'));
      return;
    }

    final response = await enrollmentsRepo.unenroll(
      userId: user.id!,
      courseId: courseId,
    );
    response.when(
      success: (_) async {
        emit(const EnrollmentsState.success([]));
        await getEnrollments();
      },
      failure: (error) => emit(
        EnrollmentsState.error(
          error.apiErrorModel.message ?? 'Error during unenrollment',
        ),
      ),
    );
  }
}
