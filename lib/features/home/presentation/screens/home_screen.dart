import 'package:education_platform_app/features/categories/presentation/categories_cubit/cubit/categories_cubit.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/home/presentation/widgets/categoery_list.dart';
import 'package:education_platform_app/features/home/presentation/widgets/courses_list.dart';
import 'package:education_platform_app/features/home/presentation/widgets/index.dart';
import '../../../sign_in/presentation/widgets/auth_imports.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  const HomeScreen({super.key, required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoriesCubit>().getCategories();
    context.read<CoursesCubit>().getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(name: widget.name),
      body: _buildBody(context),
    );
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
