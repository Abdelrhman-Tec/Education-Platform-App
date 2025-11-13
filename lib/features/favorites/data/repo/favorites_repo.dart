import 'package:education_platform_app/core/errors/api_error_handler.dart';
import 'package:education_platform_app/core/networking/api_result.dart';
import 'package:education_platform_app/core/networking/api_services.dart';
import 'package:education_platform_app/features/favorites/data/model/favorites_request_model.dart';
import 'package:education_platform_app/features/favorites/data/model/favorites_response_model.dart';

class FavoritesRepo {
  final ApiService apiService;
  FavoritesRepo(this.apiService);

  Future<ApiResult<FavoritesResponseModel>> getFavorites(int userId) async {
    try {
      final response = await apiService.getFavorites(userId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<FavoritesResponseModel>> addToFavorites(
    FavoritesRequestModel body,
  ) async {
    try {
      final response = await apiService.addToFavorites(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<FavoritesRemoveResponseModel>> removeFromFavorites({
    required int courseId,
    required int userId,
  }) async {
    try {
      final response = await apiService.removeFromFavorites(userId, courseId);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
