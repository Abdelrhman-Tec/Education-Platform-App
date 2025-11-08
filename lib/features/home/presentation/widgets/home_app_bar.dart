import '../../../sign_in/presentation/widgets/auth_imports.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200.w,
          height: 60.h,
          child: Row(
            children: [
              Expanded(
                child: CircleAvatar(
                  backgroundColor: AppColors.mediumBlue,
                  radius: 24.r,
                  child: Text(
                    'A',
                    style: AppTextStyles.titleSmallBold.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              horizontalSpace(10),
              Text("Abdelrhman Nada", style: AppTextStyles.titleSmallSemiBold),
            ],
          ),
        ),
        const Spacer(),
        Stack(
          children: [
            Icon(Icons.shopping_cart, color: AppColors.mediumBlue),
            Positioned(
              right: 11.w,
              child: Container(
                width: 13.w,
                height: 13.h,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "0",
                      style: AppTextStyles.titleSmallSemiBold.copyWith(
                        color: AppColors.white,
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ).paddingSymmetric(h: 20, v: 20);
  }
}
