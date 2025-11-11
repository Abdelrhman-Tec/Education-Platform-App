import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';
import 'package:education_platform_app/features/cart/presentation/widgets/course_item_cart.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool showSkeleton = false;
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getAllItemCart(2);
    handleSkeletonLoading(this, (value) {
      setState(() {
        showSkeleton = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).cart,
        showBack: false,
        backgroundColor: AppColors.mediumBlue,
        textColor: AppColors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade400),
              ),
              width: double.infinity,
              child: Column(children: [buildCoursesListView(showSkeleton)]),
            ),
          ],
        ).paddingSymmetric(h: 20, v: 30),
      ),
    );
  }
}

Widget buildCoursesListView(bool showSkeleton) {
  return BlocBuilder<CartCubit, CartState<dynamic>>(
    builder: (context, state) {
      return state.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.mediumBlue),
        ),
        success: (cart) => SizedBox(
          height: 360.h,
          child: Skeletonizer(
            enabled: showSkeleton,
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
                      onDelete: () => context.pushNamed(
                        Routes.courseDetailsScreen,
                        arguments: cart,
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
        ),
        failure: (message) => Center(child: Text(message)),
      );
    },
  );
}
