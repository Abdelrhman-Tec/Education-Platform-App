import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchCourseCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  const SearchCourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  State<SearchCourseCard> createState() => _SearchCourseCardState();
}

class _SearchCourseCardState extends State<SearchCourseCard> {
bool _showSkeleton = true;

@override
void initState() {
  super.initState();
  handleSkeletonLoading(this, (value) {
    setState(() {
      _showSkeleton = value;
    });
  });
}


  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: _showSkeleton,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image on the left
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                (widget.imageUrl),
                width: 100.w,
                height: 80.h,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 100.w,
                  height: 80.h,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported, size: 30),
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Text column on the right
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyles.titleSmallSemiBold.copyWith(
                      fontSize: 16.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.description,
                    style: AppTextStyles.titleSmallBold.copyWith(
                      fontSize: 14.sp,
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
