import 'package:education_platform_app/features/home/presentation/widgets/categoery_list.dart';
import 'package:education_platform_app/features/home/presentation/widgets/courses_list.dart';
import 'package:education_platform_app/features/home/presentation/widgets/index.dart';
import '../../../sign_in/presentation/widgets/auth_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HomeAppBar(), body: _buildBody(context));
  }
}

Widget _buildBody(context) {
  return SingleChildScrollView(
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleHeaderHomePage(),
          HomeSearchBar(),
          verticalSpace(30),
          SectionTitle(sectionTitle: S.of(context).categories),
          verticalSpace(20),
          CategoriesList(),
          verticalSpace(30),
          SectionTitle(sectionTitle: S.of(context).popularCourses),
          verticalSpace(30),
          CoursesList(),
          verticalSpace(100),
        ],
      ),
    ),
  );
}
