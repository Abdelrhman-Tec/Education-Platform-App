import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState<T> with _$AuthState<T> {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success(T data) = Success<T>;
  const factory AuthState.failure({required String message}) = Failure<T>;
}
