import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color backgroundColor;
  final Color iconColor;
  final double? width;
  final double? height;
  final double borderRadius;

  const CategoryItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.backgroundColor = const Color(0xFFFFF3CD),
    this.iconColor = Colors.yellow,
    this.width,
    this.height,
    this.borderRadius = 14,
  });

  @override
  Widget build(BuildContext context) {
    final double w = width ?? MediaQuery.of(context).size.width * 0.3;
    final double h = height ?? w;

    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: w * 0.3, color: iconColor),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: w * 0.13,
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
