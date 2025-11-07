import 'package:education_platform_app/app.dart';
import 'package:education_platform_app/core/di/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupGetIt();
  runApp(const EducationPlatformApp());
}
