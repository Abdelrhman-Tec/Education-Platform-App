import '../../../sign_in/presentation/widgets/auth_imports.dart';

class MySearchDelegate extends SearchDelegate {
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
  InputDecorationTheme get searchFieldDecorationTheme {
    return InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 16),
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
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

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).writeWhatYouWant,
        style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Center(
          child: Icon(Icons.search, size: 80, color: Colors.grey.shade500),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text(
            S.of(context).searchCoursesTitle,
            style: AppTextStyles.titleSmallBold,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            S.of(context).searchCoursesSubtitle,
            style: AppTextStyles.titleSmallBold.copyWith(
              fontSize: 14,
              color: Colors.grey.shade400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
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
        const Spacer(),
      ],
    );
  }
}
