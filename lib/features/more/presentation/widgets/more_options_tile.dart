import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:education_platform_app/export.dart';

class MoreOptionTile extends StatelessWidget {
  final Widget title;
  final IconData icon;
  final Function()? onTap;
  final Widget? trailing; // جديد

  const MoreOptionTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing, // جديد
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Icon(icon, color: AppColors.mediumBlue),
          title: title,
          trailing:
              trailing ??
              const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Colors.grey,
              ),
          onTap: onTap, // استخدام الـ callback الخارجي
        ),
      ),
    );
  }
}
