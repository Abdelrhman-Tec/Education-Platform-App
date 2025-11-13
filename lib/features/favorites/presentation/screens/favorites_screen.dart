import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/favorites/presentation/favorites_cubit/cubit/favorites_cubit.dart';
import 'package:education_platform_app/features/home/presentation/widgets/course_card.dart';
import 'package:education_platform_app/features/sign_in/data/model/login_response_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).favoriteCourses,
        backgroundColor: AppColors.mediumBlue,
        textColor: Colors.white,
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('لا توجد بيانات بعد')),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (favoritesResponse) {
              final favorites = favoritesResponse.data ?? [];
              if (favorites.isEmpty) {
                return const Center(child: Text('لا توجد كورسات في المفضلة'));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final fav = favorites[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CourseCard(
                      showRemoveFavoriteBtn: true,
                      imageUrl: fav.image ?? '',
                      title: fav.title ?? 'بدون عنوان',
                      price: fav.price ?? '0',
                      students: fav.students ?? 0,
                      lectures: 0,
                      likes: fav.likes ?? 0,
                      onRemoveFavorite: () {
                        final cubit = context.read<FavoritesCubit>();
                        final userJson = SharedPrefsService.getString('user');
                        final user = User.fromJson(
                          jsonDecode(userJson!)['user'],
                        );

                        cubit
                            .removeFromFavorites(
                              userId: user.id!,
                              courseId: fav.id!,
                            )
                            .then((_) {
                              cubit.getFavorites();
                            });
                      },
                    ),
                  );
                },
              );
            },
            failure: (message) => Center(child: Text('حدث خطأ: $message')),
          );
        },
      ),
    );
  }
}
