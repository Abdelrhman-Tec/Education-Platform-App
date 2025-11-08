part of 'categories_cubit.dart';

@freezed
class CategoriesState<T> with _$CategoriesState<T> {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading() = Loading;
  const factory CategoriesState.success(T data) = Success<T>;
  const factory CategoriesState.failure(String message) = _Failure<T>;
}
