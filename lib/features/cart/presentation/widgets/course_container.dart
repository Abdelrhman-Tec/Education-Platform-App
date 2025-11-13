import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/cart/data/model/cart_response_model.dart';

class CoursesContainer extends StatelessWidget {
  final List<Cart>? cartItems;
  final Widget child;
  final double? height;
  final double? width;
  final Color? borderColor;
  final double? borderRadius;

  const CoursesContainer({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.borderColor,
    this.borderRadius,
    this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        border: Border.all(color: borderColor ?? Colors.grey.shade700),
      ),
      width: width ?? double.infinity,
      height: height ?? 400.h,
      child: (cartItems != null && cartItems!.isEmpty)
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 50,
                    color: AppColors.mediumBlue.withValues(alpha: 0.5),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'السلة فارغة',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.mediumBlue.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            )
          : child,
    );
  }
}
