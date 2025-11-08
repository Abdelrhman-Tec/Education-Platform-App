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
              Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/icons/profile.jpg"),
                  ),
                  shape: BoxShape.circle,
                  color: AppColors.lightGreyBlue,
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
            Icon(Icons.shopping_cart, color: AppColors.mediumBlue, size: 26),
            Positioned(
              right: 13.w,
              child: Container(
                width: 14.w,
                height: 14.h,
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
