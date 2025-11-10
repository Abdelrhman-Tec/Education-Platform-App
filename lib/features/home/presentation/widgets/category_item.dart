import 'package:cached_network_image/cached_network_image.dart';
import 'package:education_platform_app/features/sign_in/presentation/widgets/auth_imports.dart';

class CategoryItem extends StatelessWidget {
  final VoidCallback? ontap;
  final String title;
  final String iconPath;
  final String backgroundColorHex;
  final String iconColorHex;
  final double? width;
  final double? height;
  final double borderRadius;

  const CategoryItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.backgroundColorHex,
    required this.iconColorHex,
    this.width,
    this.height,
    this.borderRadius = 14,
    this.ontap,
  });

  Color _hexToColor(String hex) {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) hex = "FF$hex";
    return Color(int.parse(hex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final double w = width ?? MediaQuery.of(context).size.width * 0.3;
    final double h = height ?? w;

    final Color bgColor = _hexToColor(backgroundColorHex);
    final Color iconColor = _hexToColor(iconColorHex);

    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: (iconPath),
              width: w * 0.3,
              color: iconColor,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: 5),
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
      ),
    );
  }
}
