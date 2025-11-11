import 'package:bloc/bloc.dart';
import 'package:education_platform_app/core/networking/api_result.dart';
import 'package:education_platform_app/features/categories/data/model/categories_response_model.dart';
import 'package:education_platform_app/features/categories/data/repo/categories_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState<List<CategoriesResponseModel>>> {
  final CategoriesRepo categoriesRepo;
  CategoriesCubit(this.categoriesRepo) : super(const CategoriesState.initial());

  Future<void> getCategories() async {
    emit(const CategoriesState.loading());
    final response = await categoriesRepo.getCategories();
    response.when(
      success: (categories) {
        emit(CategoriesState.success(categories));
      },
      failure: (error) {
        emit(CategoriesState.failure(error.toString()));
      },
    );
  }
}
