import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/courses/presentation/widgets/video_player_card.dart';

class CourseVideoPlayer extends StatelessWidget {
  final String? videoUrl;
  final String? thumbnailUrl;

  const CourseVideoPlayer({
    super.key,
    required this.videoUrl,
    this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (videoUrl == null || videoUrl!.isEmpty) {
      return _buildPlaceholder();
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: ProfessionalVideoPlayer(
          videoUrl: videoUrl!,
          thumbnailUrl: thumbnailUrl,
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.videocam_off, size: 50.sp, color: Colors.grey.shade500),
            SizedBox(height: 8.h),
            Text(
              'لا يوجد فيديو متاح',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
