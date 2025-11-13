part of 'enrollments_cubit.dart';
@freezed
class EnrollmentsState<T> with _$EnrollmentsState<T> {
  const factory EnrollmentsState.initial() = _Initial;
  const factory EnrollmentsState.loading() = _Loading;
  const factory EnrollmentsState.success(T data) = _Success<T>;
  const factory EnrollmentsState.error(String message) = _Error<T>;
}
