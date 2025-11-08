import 'package:education_platform_app/features/home/presentation/widgets/index.dart';
import '../../../sign_in/presentation/widgets/auth_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }
}

Widget _buildBody(context) {
  return SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(),
        TitleHeaderHomePage(),
        HomeSearchBar(),
        verticalSpace(30),
        SectionTitle(sectionTitle: S.of(context).categories),
        verticalSpace(20),
        CategoryItem(
          title: "التسويق",
          iconPath: "assets/icons/marketing.png",
          iconColor: AppColors.yellow,
          backgroundColor: Colors.amber.shade100.withValues(alpha: 0.7),
        ),
        verticalSpace(30),
        SectionTitle(sectionTitle: S.of(context).popularCourses),
      ],
    ),
  );
}
