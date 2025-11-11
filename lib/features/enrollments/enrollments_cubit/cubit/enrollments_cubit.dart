import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:education_platform_app/core/cache/shared_prefs_service.dart';
import 'package:education_platform_app/core/networking/api_result.dart';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';
import 'package:education_platform_app/features/enrollments/data/model/enrollments_request_model.dart';
import 'package:education_platform_app/features/enrollments/data/repo/enrollments_repo.dart';
import 'package:education_platform_app/features/sign_in/data/model/login_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
        success: (_) {
          emit(
            const EnrollmentsState.success(
              message: 'Enrolled all courses successfully',
            ),
          );
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
}
