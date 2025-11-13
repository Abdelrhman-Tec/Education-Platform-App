part of 'favorites_cubit.dart';

@freezed
class FavoritesState<T> with _$FavoritesState<T> {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loading() = _Loading;
  const factory FavoritesState.success(T data) = Success<T>;
  const factory FavoritesState.failure({required String message}) = _Failure<T>;
}
