import 'package:education_platform_app/features/courses/presentation/widgets/video_player_card.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';

class LessonPlayer extends StatefulWidget {
  final String videoUrl;
  final String? thumbnailUrl;
  final String title;
  final double progress;

  const LessonPlayer({
    super.key,
    required this.videoUrl,
    required this.title,
    this.thumbnailUrl,
    this.progress = 0.6,
  });

  @override
  State<LessonPlayer> createState() => _LessonPlayerState();
}

class _LessonPlayerState extends State<LessonPlayer>
    with SingleTickerProviderStateMixin {
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, dynamic>> _comments = [
    {
      "text": "شرح ممتاز جدًا ❤️",
      "user": "أحمد محمد",
      "time": "منذ ساعتين",
      "avatar": "👨‍💻",
    },
    {
      "text": "ممكن توضح جزء الأدوات أكتر؟",
      "user": "سارة عبدالله",
      "time": "منذ يوم",
      "avatar": "👩‍🎓",
    },
  ];

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _addComment() {
    if (_commentController.text.trim().isEmpty) return;

    setState(() {
      _comments.insert(0, {
        "text": _commentController.text.trim(),
        "user": "أنت",
        "time": "الآن",
        "avatar": "👤",
      });
      _commentController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomLessonAppBar(),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // 🎬 Video Section
                SliverToBoxAdapter(
                  child: _VideoSection(
                    videoUrl: widget.videoUrl,
                    thumbnailUrl: widget.thumbnailUrl,
                    title: widget.title,
                    progress: widget.progress,
                  ),
                ),

                // 📚 Description Section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const AnimatedDescriptionBox(),
                  ),
                ),

                // 💬 Comments Header
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 16.h,
                    ),
                    child: _CommentsHeader(),
                  ),
                ),

                // ✍️ Add Comment
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: _AddCommentSection(
                      controller: _commentController,
                      onAdd: _addComment,
                    ),
                  ),
                ),

                // 🗒️ Comments List
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 8.h,
                      ),
                      child: AnimatedCommentCard(
                        comment: _comments[index],
                        index: index,
                      ),
                    ),
                    childCount: _comments.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 🎬 Custom App Bar
class CustomLessonAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomLessonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mediumBlue,
      elevation: 0,
      leading: CustomBackButton(),
      centerTitle: true,
      title: const Text(
        "مشغل الدروس",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.bookmark, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 🎬 Video Section Widget
class _VideoSection extends StatelessWidget {
  final String videoUrl;
  final String? thumbnailUrl;
  final String title;
  final double progress;

  const _VideoSection({
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.title,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            // Video Player
            ProfessionalVideoPlayer(
              videoUrl: videoUrl,
              thumbnailUrl: thumbnailUrl,
              autoPlay: false,
              looping: false,
            ),

            // Video Info
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Bar
                  _AnimatedProgressBar(progress: progress),
                  verticalSpace(12),

                  // Title
                  Text(
                    title,
                    style: AppTextStyles.titleSmallSemiBold.copyWith(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                  ),
                  verticalSpace(4),

                  // Duration
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_rounded,
                        size: 16,
                        color: AppColors.mediumBlue,
                      ),
                      horizontalSpace(4),
                      Text(
                        "مدة الفيديو: 3:20 دقيقة",
                        style: AppTextStyles.bodySmallNormal.copyWith(
                          color: AppColors.mediumBlue,
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
    );
  }
}

// 📊 Animated Progress Bar
class _AnimatedProgressBar extends StatefulWidget {
  final double progress;

  const _AnimatedProgressBar({required this.progress});

  @override
  State<_AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<_AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: widget.progress)
        .animate(
          CurvedAnimation(
            parent: _progressController,
            curve: Curves.easeOutQuart,
          ),
        );

    _progressController.forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return Column(
          children: [
            LinearProgressIndicator(
              value: _progressAnimation.value,
              minHeight: 6,
              backgroundColor: Colors.grey.shade200,
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            verticalSpace(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${(_progressAnimation.value * 100).toStringAsFixed(0)}% مكتمل",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.mediumBlue,
                  ),
                ),
                Text(
                  "3:20 / 5:00",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

// 📚 Animated Description Box
class AnimatedDescriptionBox extends StatefulWidget {
  const AnimatedDescriptionBox({super.key});

  @override
  State<AnimatedDescriptionBox> createState() => _AnimatedDescriptionBoxState();
}

class _AnimatedDescriptionBoxState extends State<AnimatedDescriptionBox>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _controller;
  late Animation<double> _heightAnimation;
  late Animation<double> _rotationAnimation;

  final List<Map<String, dynamic>> attachedFiles = [
    {
      "name": "ملف الملاحظات.pdf",
      "icon": Icons.picture_as_pdf,
      "size": "2.4 MB",
    },
    {
      "name": "الشريحة التقديمية.pptx",
      "icon": Icons.slideshow,
      "size": "5.1 MB",
    },
    {"name": "ملفات التمرين.zip", "icon": Icons.folder_zip, "size": "12.3 MB"},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _heightAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _toggleExpansion,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.description_rounded,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ),
                        horizontalSpace(12),
                        Text(
                          'تفاصيل الدرس',
                          style: AppTextStyles.titleSmallSemiBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    AnimatedBuilder(
                      animation: _rotationAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotationAnimation.value * 3.14159,
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: AppColors.mediumBlue,
                            size: 28,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Expandable Content
          AnimatedBuilder(
            animation: _heightAnimation,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  heightFactor: _heightAnimation.value,
                  child: child,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'في هذا الدرس سنتعلم مقدمة حول التصميم باستخدام Adobe InDesign '
                    'وكيفية استخدام الأدوات الأساسية بشكل احترافي.',
                    style: AppTextStyles.bodySmallNormal.copyWith(
                      height: 1.6,
                      color: AppColors.mediumBlue,
                    ),
                  ),
                  verticalSpace(20),

                  // Attached Files
                  Text(
                    'الملفات المرفقة',
                    style: AppTextStyles.titleSmallSemiBold.copyWith(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                  verticalSpace(12),

                  ...attachedFiles.map((file) => _FileItem(file: file)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 📁 File Item Widget
class _FileItem extends StatelessWidget {
  final Map<String, dynamic> file;

  const _FileItem({required this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(file['icon'], color: AppColors.primary),
        ),
        title: Text(
          file['name'],
          style: AppTextStyles.bodySmallNormal.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          file['size'],
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.download_rounded,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}

// 💬 Comments Header
class _CommentsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.chat_bubble_outline_rounded,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        horizontalSpace(12),
        Text(
          "التعليقات",
          style: AppTextStyles.titleSmallSemiBold.copyWith(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "١٥",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}

// ✍️ Add Comment Section
class _AddCommentSection extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const _AddCommentSection({required this.controller, required this.onAdd});

  @override
  State<_AddCommentSection> createState() => _AddCommentSectionState();
}

class _AddCommentSectionState extends State<_AddCommentSection> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _hasText = widget.controller.text.trim().isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: "اكتب تعليقك هنا...",
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 16.h,
                ),
              ),
              maxLines: null,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.only(left: 8.w, right: 12.w),
            decoration: BoxDecoration(
              color: _hasText ? AppColors.primary : Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.send_rounded,
                color: _hasText ? Colors.white : Colors.grey.shade500,
                size: 22,
              ),
              onPressed: _hasText ? widget.onAdd : null,
            ),
          ),
        ],
      ),
    );
  }
}

// 💭 Animated Comment Card
class AnimatedCommentCard extends StatefulWidget {
  final Map<String, dynamic> comment;
  final int index;

  const AnimatedCommentCard({
    super.key,
    required this.comment,
    required this.index,
  });

  @override
  State<AnimatedCommentCard> createState() => _AnimatedCommentCardState();
}

class _AnimatedCommentCardState extends State<AnimatedCommentCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500 + (widget.index * 200)),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.all(16.w),
            leading: Container(
              width: 45.w,
              height: 45.w,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  widget.comment["avatar"],
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
            ),
            title: Row(
              children: [
                Text(
                  widget.comment["user"],
                  style: AppTextStyles.bodySmallNormal.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyBlue,
                  ),
                ),
                horizontalSpace(8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: widget.comment["user"] == "أنت"
                        ? AppColors.primary.withOpacity(0.1)
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.comment["time"],
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: widget.comment["user"] == "أنت"
                          ? AppColors.primary
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                widget.comment["text"],
                style: AppTextStyles.bodySmallNormal.copyWith(height: 1.4),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite_border_rounded,
                color: Colors.grey.shade400,
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

// Custom Back Button
class CustomBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
        iconSize: 20,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
