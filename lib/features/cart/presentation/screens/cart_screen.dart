import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/cart/presentation/cart_cubit/cubit/cart_cubit.dart';
import 'package:education_platform_app/features/cart/presentation/widgets/course_container.dart';
import 'package:education_platform_app/features/cart/presentation/widgets/course_list_view.dart';
import 'package:education_platform_app/features/cart/presentation/widgets/course_summary_card.dart';

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
        showBack: true,
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
            CoursesContainer(child: CourseListView()),
            verticalSpace(20),
            CoursesContainer(
              height: 250.h,
              child: CheckoutSummaryCard(
                hintText: S.of(context).enterCoupon,
                applyText: S.of(context).apply,
                subtotal: 0,
                discount: 0,
                total: 0,
                onApply: () {
                  // Logic to apply coupon
                },
              ),
            ),
            verticalSpace(20),
            CustomButton(
              backgroundColor: AppColors.yellow,
              text: S.of(context).checkout,
              onPressed: () {},
            ),
          ],
        ).paddingSymmetric(h: 20, v: 30),
      ),
    );
  }
}
