import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/favorites/presentation/favorites_cubit/cubit/favorites_cubit.dart';
import 'package:education_platform_app/features/sign_in/data/model/login_response_model.dart';
import 'package:share_plus/share_plus.dart';

class CourseDetailsAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final CoursesResponseModel course;

  const CourseDetailsAppBar({super.key, required this.course});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CourseDetailsAppBar> createState() => _CourseDetailsAppBarState();
}

class _CourseDetailsAppBarState extends State<CourseDetailsAppBar> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final favoritesJson = SharedPrefsService.getString('favorites') ?? '[]';
    final List<int> favoriteIds = List<int>.from(jsonDecode(favoritesJson));
    setState(() {
      isFavorite = favoriteIds.contains(widget.course.id);
    });
  }

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
      _buildIconButton(
        icon: Icons.bookmark,
        onTap: _bookmarkCourse,
        color: isFavorite ? AppColors.yellow : AppColors.white,
      ),
    ],
  );

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
    Color color = AppColors.white,
  }) => GestureDetector(
    onTap: onTap,
    child: Icon(icon, color: color, size: 22),
  );

  void _shareCourse() {
    final String text =
        'Check out this course: ${widget.course.title}\n\n'
        '${widget.course.description!.length > 200 ? "${widget.course.description!.substring(0, 200)}..." : widget.course.description}\n\n'
        'See more at: https://yourwebsite.com/courses/${widget.course.id}';

    SharePlus.instance.share(
      ShareParams(text: text, subject: widget.course.title ?? 'Course Details'),
    );
  }

  void _bookmarkCourse() async {
    final favoritesCubit = context.read<FavoritesCubit>();
    final userJson = SharedPrefsService.getString('user');
    final user = User.fromJson(jsonDecode(userJson!)['user']);

    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      favoritesCubit.addToFavorites(widget.course.id!);
    } else {
      favoritesCubit.removeFromFavorites(
        userId: user.id!,
        courseId: widget.course.id!,
      );
    }

    final favoritesJson = SharedPrefsService.getString('favorites') ?? '[]';
    final List<int> favoriteIds = List<int>.from(jsonDecode(favoritesJson));

    if (isFavorite) {
      if (!favoriteIds.contains(widget.course.id)) {
        favoriteIds.add(widget.course.id!);
      }
    } else {
      favoriteIds.remove(widget.course.id);
    }

    SharedPrefsService.saveString('favorites', jsonEncode(favoriteIds));
  }
}
