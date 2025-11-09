import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:education_platform_app/features/courses/data/model/courses_response_model.dart';
import 'package:education_platform_app/features/courses/presentation/courses_cubit/cubit/courses_cubit.dart';
import 'package:education_platform_app/features/home/presentation/widgets/search_course_card.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../sign_in/presentation/widgets/auth_imports.dart';

class MySearchDelegate extends SearchDelegate {
  final CoursesCubit coursesCubit;
  final bool showSkeleton;
  Timer? _debounce;
  final VoidCallback onClose;

  MySearchDelegate({
    required this.showSkeleton,
    required this.coursesCubit,
    required this.onClose,
  });

  @override
  void close(BuildContext context, result) {
    onClose();
    super.close(context, result);
  }

  @override
  String get searchFieldLabel => S.current.searchCourses;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme: searchFieldDecorationTheme,
    );
  }

  InputDecoration get searchFieldDecoration => InputDecoration(
    hintText: searchFieldLabel,
    prefixIcon: const Icon(Icons.search, color: Colors.grey),
    filled: true,
    fillColor: Colors.grey.shade200,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
  );

  @override
  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
    filled: true,
    fillColor: Colors.grey.shade200,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    if (query.isEmpty) return null;
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
      onPressed: () => close(context, null),
    );
  }

  void _onQueryChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.trim().length >= 2) {
        coursesCubit.searchCourses(query.trim());
      }
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isEmpty) {
      return Center(
        child: Text(
          S.of(context).writeWhatYouWant,
          style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
        ),
      );
    }

    _onQueryChanged(query);

    return BlocBuilder<CoursesCubit, CoursesState<List<Course>>>(
      bloc: coursesCubit,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (courses) => courses.isEmpty
              ? Center(child: Text("لا توجد نتائج"))
              : ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return SearchCourseCard(
                      imageUrl: course.image ?? '',
                      title: course.title ?? '',
                      description: course.description ?? '',
                    );
                  },
                ),
          failure: (error) => Center(
            child: Text(error, style: const TextStyle(color: Colors.red)),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().length < 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 80, color: Colors.grey.shade500),
          const SizedBox(height: 10),
          Text(
            S.of(context).searchCoursesSubtitle,
            style: AppTextStyles.titleSmallBold.copyWith(
              fontSize: 14,
              color: Colors.grey.shade400,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.withValues(alpha: 0.4)),
              ),
              child: Center(
                child: Text(
                  S.of(context).typeAtLeastTwo,
                  style: const TextStyle(fontSize: 15, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withValues(alpha: 0.4)),
            ),
            child: Center(
              child: Text(
                S.of(context).typeAtLeastTwo,
                style: const TextStyle(fontSize: 15, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
    }

    _onQueryChanged(query);

    return BlocBuilder<CoursesCubit, CoursesState<List<Course>>>(
      bloc: coursesCubit,
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (courses) => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return Skeletonizer(
                enabled: showSkeleton,
                child: ListTile(
                  title: Text(course.title ?? ''),
                  subtitle: Text(course.description ?? ''),
                  onTap: () => close(context, course),
                ),
              );
            },
          ),
          failure: (error) => Center(
            child: Text(error, style: const TextStyle(color: Colors.red)),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
