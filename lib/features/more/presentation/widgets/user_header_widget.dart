import 'package:education_platform_app/core/routing/index.dart';
import 'package:flutter_animate/flutter_animate.dart';

class UserHeaderWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String name;

  const UserHeaderWidget({super.key, required this.firstName, required this.lastName, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
              backgroundColor: AppColors.mediumBlue,
              radius: 40,
              child: Text(
                name.isNotEmpty ? name[0] : '?',
                style: AppTextStyles.titleSmallSemiBold.copyWith(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            )
            .animate()
            .scale(begin: const Offset(0.5, 0.5), curve: Curves.easeOutBack)
            .fadeIn(duration: 400.ms),

        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstName,
              style: AppTextStyles.titleMediumBold,
            ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2),
            horizontalSpace(10),
            Text(
              lastName,
              style: AppTextStyles.titleMediumBold,
            ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2),
          ],
        ),
      ],
    );
  }
}
