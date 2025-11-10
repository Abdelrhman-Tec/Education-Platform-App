import 'package:education_platform_app/core/helpers/spacing.dart';
import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:education_platform_app/export.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';

class CourseDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Course course;

  const CourseDetailsAppBar({super.key, required this.course});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.mediumBlue,
      title: Row(
        children: [
          _buildBackButton(context),
          const Spacer(),
          _buildActionIcons(),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) => GestureDetector(
    onTap: () => Navigator.of(context).pop(),
    child: const Icon(
      Icons.arrow_back_ios_new_outlined,
      color: AppColors.white,
      size: 20,
    ),
  );

  Widget _buildActionIcons() => Row(
    children: [
      _buildIconButton(icon: Icons.share, onTap: _shareCourse),
      horizontalSpace(12),
      _buildIconButton(icon: Icons.bookmark, onTap: _bookmarkCourse),
    ],
  );

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Icon(icon, color: AppColors.white, size: 22),
  );

  void _shareCourse() {}
  void _bookmarkCourse() {}
}