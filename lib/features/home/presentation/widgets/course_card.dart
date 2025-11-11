import 'package:cached_network_image/cached_network_image.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';

class CourseCard extends StatelessWidget {
  final VoidCallback? ontap;
  final String imageUrl;
  final String title;
  final String price;
  final int students;
  final int lectures;
  final int likes;

  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.students,
    required this.lectures,
    required this.likes,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 300.w,
          height: 360.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: (imageUrl),
                fit: BoxFit.cover,
                height: 210.h,
                width: double.infinity,
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade200,
                  height: 210.h,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade200,
                  height: 210.h,
                  child: const Icon(Icons.image_not_supported, size: 50),
                ),
              ),
              Divider(color: Colors.grey.shade400),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  title,
                  style: AppTextStyles.titleSmallSemiBold.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  price,
                  style: AppTextStyles.titleSmallSemiBold.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.brightGreen,
                  ),
                ),
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconText(Icons.person, '$students طالب'),
                  _iconText(Icons.video_collection, '$lectures محاضرة'),
                  _iconText(Icons.favorite, '$likes إعجاب'),
                ],
              ).paddingSymmetric(h: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade300),
        horizontalSpace(5),
        Text(
          text,
          style: AppTextStyles.titleSmallSemiBold.copyWith(
            fontSize: 10.sp,
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
