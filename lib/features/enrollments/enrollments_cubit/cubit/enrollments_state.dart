part of 'enrollments_cubit.dart';

@freezed
class EnrollmentsState<T> with _$EnrollmentsState<T> {
  const factory EnrollmentsState.initial() = _Initial;
  const factory EnrollmentsState.loading() = _Loading;
  const factory EnrollmentsState.success({required String message}) =Success<T>;
  const factory EnrollmentsState.error(String message) = Error<T>;
}
