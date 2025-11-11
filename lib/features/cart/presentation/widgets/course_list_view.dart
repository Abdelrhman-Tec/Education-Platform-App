import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';
import 'package:education_platform_app/features/cart/presentation/widgets/course_item_cart.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CourseListView extends StatelessWidget {
  const CourseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState<dynamic>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.mediumBlue),
          ),
          success: (cart) => SizedBox(
            height: 360.h,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: cart.length,
              separatorBuilder: (_, __) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = cart[index];
                return CourseItemCard(
                      imagePath: item.course!.image ?? '',
                      title: item.course!.title ?? '',
                      price: item.course!.price ?? '',
                      onTap: () => context.pushNamed(
                        Routes.courseDetailsScreen,
                        arguments: cart,
                      ),
                      onDelete: () => context.read<CartCubit>().removeFromCart(
                        courseId: item.id!,
                      ),
                    )
                    .animate(delay: (index * 100).ms)
                    .fadeIn(duration: 700.ms)
                    .slideY(
                      begin: 0.2,
                      duration: 400.ms,
                      curve: Curves.easeOut,
                    );
              },
            ),
          ),

          failure: (message) => Center(child: Text(message)),
        );
      },
    );
  }
}
