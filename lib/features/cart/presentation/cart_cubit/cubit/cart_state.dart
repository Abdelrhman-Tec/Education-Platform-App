part of 'cart_cubit.dart';

@freezed
class CartState<T> with _$CartState<T> {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.success(T data) = Success<T>;
  const factory CartState.failure(String message) = _Failure<T>;
}
