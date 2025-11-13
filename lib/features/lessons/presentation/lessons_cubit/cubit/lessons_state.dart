part of 'lessons_cubit.dart';

@freezed
class LessonsState<T> with _$LessonsState<T> {
  const factory LessonsState.initial() = _Initial;
  const factory LessonsState.loading() = _Loading;
  const factory LessonsState.success(T data) = Success<T>;
  const factory LessonsState.error({required String message}) = Error<T>;
}
