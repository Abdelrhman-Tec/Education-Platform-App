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
        SizedBox(
          height: 120.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [

              horizontalSpace(10),
            ],
          ),
        ),

        verticalSpace(30),
        SectionTitle(sectionTitle: S.of(context).popularCourses),
      ],
    ),
  );
}
