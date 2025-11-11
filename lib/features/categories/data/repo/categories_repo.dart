import 'package:education_platform_app/features/categories/data/model/categories_response_model.dart';
import 'package:education_platform_app/features/sign_in/data/repo/auth_import_repo.dart';

class CategoriesRepo {
  final ApiService apiService;
  CategoriesRepo(this.apiService);

  Future<ApiResult<List<CategoriesResponseModel>>> getCategories() async {
    try {
      final response = await apiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
