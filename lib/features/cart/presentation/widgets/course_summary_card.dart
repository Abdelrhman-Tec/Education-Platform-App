import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:education_platform_app/core/widgets/custom_text_field.dart';
import 'package:education_platform_app/export.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CheckoutSummaryCard extends StatelessWidget {
  final String hintText;
  final String applyText;
  final double subtotal;
  final double discount;
  final double total;
  final VoidCallback? onApply;

  const CheckoutSummaryCard({
    super.key,
    required this.hintText,
    required this.applyText,
    required this.subtotal,
    required this.discount,
    required this.total,
    this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coupon input with Apply button
          Stack(
            children: [
              CustomTextFormField(
                borderColor: Colors.transparent,
                hintText: hintText,
              ).animate().fadeIn(duration: 500.ms),
              Positioned(
                left: 0,
                top: 0,
                child: GestureDetector(
                  onTap: onApply,
                  child:
                      Container(
                            width: 100.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.mediumBlue,
                            ),
                            child: Center(
                              child: Text(
                                applyText,
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .slideX(begin: 0.3, duration: 500.ms),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Subtotal
          Row(
                children: [
                  Text("Subtotal"),
                  const Spacer(),
                  Text("\$${subtotal.toStringAsFixed(2)}"),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms)
              .slideY(begin: 0.2, duration: 400.ms),
          SizedBox(height: 10.h),

          // Discount
          Row(
                children: [
                  Text("Discount"),
                  const Spacer(),
                  Text("-\$${discount.toStringAsFixed(2)}"),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms)
              .slideY(begin: 0.2, duration: 400.ms),
          SizedBox(height: 10.h),

          Divider(color: Colors.grey.shade300, thickness: 1),

          // Total
          Row(
                children: [
                  Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text(
                    "\$${total.toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
              .animate()
              .fadeIn(duration: 500.ms)
              .slideY(begin: 0.2, duration: 400.ms),
        ],
      ),
    );
  }
}
