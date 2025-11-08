import '../../../sign_in/presentation/widgets/auth_imports.dart';

class TitleHeaderHomePage extends StatelessWidget {
  const TitleHeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).searchHeaderLine1,
          style: AppTextStyles.titleMediumBold.copyWith(fontSize: 35.sp),
        ),
        verticalSpace(10),
        Text(
          S.of(context).searchHeaderLine2,
          style: AppTextStyles.titleMediumBold.copyWith(fontSize: 30.sp),
        ),
        verticalSpace(10),
      ],
    ).paddingSymmetric(h: 20);
  }
}
