part of 'courses_cubit.dart';

@freezed
class CoursesState<T> with _$CoursesState<T> {
  const factory CoursesState.initial() = _Initial;
  const factory CoursesState.loading() = Loading;
  const factory CoursesState.success(T data) = Success<T>;
  const factory CoursesState.failure(String message) = _Failure<T>;
}
