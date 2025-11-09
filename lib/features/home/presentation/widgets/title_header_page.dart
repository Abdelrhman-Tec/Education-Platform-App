import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../sign_in/presentation/widgets/auth_imports.dart';

class TitleHeaderHomePage extends StatefulWidget {
  const TitleHeaderHomePage({super.key});

  @override
  State<TitleHeaderHomePage> createState() => _TitleHeaderHomePageState();
}

class _TitleHeaderHomePageState extends State<TitleHeaderHomePage> {
bool _showSkeleton = true;

@override
void initState() {
  super.initState();
  handleSkeletonLoading(this, (value) {
    setState(() {
      _showSkeleton = value;
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: _showSkeleton,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
                S.of(context).searchHeaderLine1,
                style: AppTextStyles.titleMediumBold.copyWith(
                  fontSize: 35.sp,
                  color: AppColors.mediumBlue,
                ),
              )
              .animate()
              .fadeIn(duration: 500.ms)
              .slideX(begin: -0.3, duration: 500.ms, curve: Curves.easeOut),

          verticalSpace(10),

          Text(
                S.of(context).searchHeaderLine2,
                style: AppTextStyles.titleMediumBold.copyWith(
                  fontSize: 30.sp,
                  color: AppColors.mediumBlue,
                ),
              )
              .animate(delay: 100.ms)
              .fadeIn(duration: 500.ms)
              .slideX(begin: -0.3, duration: 500.ms, curve: Curves.easeOut),

          verticalSpace(10),
        ],
      ).paddingSymmetric(h: 20),
    );
  }
}
