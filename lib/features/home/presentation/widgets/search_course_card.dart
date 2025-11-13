import 'package:education_platform_app/core/function/handle_skeleton_loading.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchCourseCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback? ontapDelete;
  final String? price;
  final int? students;
  final String? name;
  final int? lectures;
  final int? likes;
  final bool? showDeleteIcon;
  final VoidCallback onTap;

  const SearchCourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.price,
    this.students,
    this.lectures,
    this.likes,
    required this.onTap,
    this.name,
    this.showDeleteIcon,
    this.ontapDelete,
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
      child: GestureDetector(
        onTap: widget.onTap,
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
                  widget.imageUrl,
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
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            widget.title,
                            style: AppTextStyles.titleSmallSemiBold.copyWith(
                              fontSize: 16.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        if (widget.showDeleteIcon != null) ...[
                          GestureDetector(
                            onTap: widget.ontapDelete,
                            child: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ],
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
                    verticalSpace(10),
                    Text(
                      widget.name ?? '',
                      style: AppTextStyles.titleSmallBold.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.mediumBlue,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // New info row (optional)
                    if (widget.price != null || widget.students != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.price != null)
                            Text(
                              "Price: ${widget.price}",
                              style: AppTextStyles.titleSmallBold.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                          if (widget.students != null)
                            Text(
                              "Students: ${widget.students}",
                              style: AppTextStyles.titleSmallBold.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                        ],
                      ),
                    if (widget.lectures != null || widget.likes != null)
                      const SizedBox(height: 4),
                    if (widget.lectures != null || widget.likes != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.lectures != null)
                            Text(
                              "Lectures: ${widget.lectures}",
                              style: AppTextStyles.titleSmallBold.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                          if (widget.likes != null)
                            Text(
                              "Likes: ${widget.likes}",
                              style: AppTextStyles.titleSmallBold.copyWith(
                                fontSize: 13.sp,
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
