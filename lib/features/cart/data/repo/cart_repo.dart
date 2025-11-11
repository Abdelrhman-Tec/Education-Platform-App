import 'package:education_platform_app/features/cart/data/model/cart_request_model.dart';
import 'package:education_platform_app/features/cart/data/model/cart_response_model.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';

class CartRepo {
  final ApiService apiService;
  CartRepo(this.apiService);

  Future<ApiResult<List<Cart>>> getAllItemCart(userid) async {
    try {
      final response = await apiService.getCart(userid);
      return ApiResult.success(response.data ?? []);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CartResponseBody>> addToCart(
    CartRequestModel request,
  ) async {
    try {
      final response = await apiService.addToCart(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RemoveCartResponse>> removeFromCart({
    required int courseId,
  }) async {
    try {
      final response = await apiService.removeFromCart(courseId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  
  
}
