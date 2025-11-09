import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:education_platform_app/generated/l10n.dart';
import 'package:education_platform_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalObjectKey<NavigatorState> navigatorKey = GlobalObjectKey<NavigatorState>(
  'navigatorKey',
);

class EducationPlatformApp extends StatelessWidget {
  final String initialRoute;

  const EducationPlatformApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'NotoKufi',
            scaffoldBackgroundColor: AppColors.white,
          ),
          locale: const Locale("ar"),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorKey: navigatorKey,
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
