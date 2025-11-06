import 'package:education_platform_app/core/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: []).paddingSymmetric(h: 20.w, v: 30.h),
      ),
    );
  }
}
