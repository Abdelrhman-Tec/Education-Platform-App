import 'package:education_platform_app/core/cache/shared_prefs_service.dart';
import 'package:flutter/widgets.dart';

Future<void> handleSkeletonLoading(
  State state,
  void Function(bool) updateSkeleton,
) async {
  bool isLoading = SharedPrefsService.getBool("loading") ?? true;

  if (!isLoading) {
    updateSkeleton(false);
    return;
  }

  updateSkeleton(true);

  await Future.delayed(const Duration(seconds: 4));

  if (state.mounted) {
    updateSkeleton(false);
    SharedPrefsService.saveBool("loading", false);
  }
}
