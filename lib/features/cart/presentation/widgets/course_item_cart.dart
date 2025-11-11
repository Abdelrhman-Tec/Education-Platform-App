import 'package:education_platform_app/core/routing/index.dart';

class CourseItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const CourseItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    this.onDelete, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400),
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                width: 130,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(imagePath),
                  ),
                ),
              ),
          
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: onDelete,
                          child: Icon(Icons.delete, color: Colors.grey.shade400),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.titleSmallBold.copyWith(
                          fontSize: 13.sp,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        child: Text(
                          price,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.titleSmallBold.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.brightGreen,
                          ),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
