part of 'my_course_cubit.dart';

@freezed
class MyCourseState<T> with _$MyCourseState<T> {
  const factory MyCourseState.initial() = _Initial;
  const factory MyCourseState.loading() = _Loading;
  const factory MyCourseState.success(T data) = _Success<T>;
  const factory MyCourseState.failure({required String message}) = _Failure<T>;
}
