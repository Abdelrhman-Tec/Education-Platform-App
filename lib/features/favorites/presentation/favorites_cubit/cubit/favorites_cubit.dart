import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:education_platform_app/core/cache/shared_prefs_service.dart';
import 'package:education_platform_app/features/favorites/data/model/favorites_request_model.dart';
import 'package:education_platform_app/features/favorites/data/repo/favorites_repo.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo repo;
  FavoritesCubit(this.repo) : super(const FavoritesState.initial());

  Future<void> getFavorites() async {
    emit(const FavoritesState.loading());
    try {
      final userJson = SharedPrefsService.getString('user');
      final user = User.fromJson(jsonDecode(userJson!)['user']);
      final result = await repo.getFavorites(user.id ?? 0);
      result.when(
        success: (data) => emit(FavoritesState.success(data)),
        failure: (error) => emit(
          FavoritesState.failure(message: error.apiErrorModel.message ?? ''),
        ),
      );
    } catch (e) {
      emit(FavoritesState.failure(message: e.toString()));
    }
  }

  Future<void> addToFavorites(int courseId) async {
    emit(const FavoritesState.loading());
    try {
      final userJson = SharedPrefsService.getString('user');
      final user = User.fromJson(jsonDecode(userJson!)['user']);
      final result = await repo.addToFavorites(
        FavoritesRequestModel(userId: user.id!, courseId: courseId),
      );
      result.when(
        success: (data) => emit(FavoritesState.success(data)),
        failure: (error) => emit(
          FavoritesState.failure(message: error.apiErrorModel.message ?? ''),
        ),
      );
    } catch (e) {
      emit(FavoritesState.failure(message: e.toString()));
    }
  }

  Future<void> removeFromFavorites({
    required int userId,
    required int courseId,
  }) async {
    emit(const FavoritesState.loading());
    try {
      final result = await repo.removeFromFavorites(
        courseId: courseId,
        userId: userId,
      );
      result.when(
        success: (data) => emit(FavoritesState.success('تم الحذف بنجاح')),
        failure: (error) => emit(
          FavoritesState.failure(message: error.apiErrorModel.message ?? ''),
        ),
      );
    } catch (e) {
      emit(FavoritesState.failure(message: e.toString()));
    }
  }
}
