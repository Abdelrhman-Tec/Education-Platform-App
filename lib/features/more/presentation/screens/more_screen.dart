import 'package:education_platform_app/core/function/snakbar.dart';
import 'package:education_platform_app/core/routing/index.dart';
import 'package:education_platform_app/features/more/presentation/widgets/more_options_tile.dart';
import 'package:education_platform_app/features/more/presentation/widgets/user_header_widget.dart';
import 'package:education_platform_app/features/sign_in/data/model/login_response_model.dart';
import 'package:education_platform_app/features/sign_in/presentation/sign_in_cubit/cubit/login_state.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  LoginResponseModel? loginResponse;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userJson = SharedPrefsService.getString('user');
    if (userJson != null && userJson.isNotEmpty) {
      final decoded = jsonDecode(userJson);
      setState(() {
        loginResponse = LoginResponseModel.fromJson(decoded);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final firstName = loginResponse?.user?.firstName ?? 'Guest';
    final lastName = loginResponse?.user?.lastName ?? 'Guest';

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            UserHeaderWidget(
                  firstName: firstName,
                  lastName: lastName,
                  name: '$firstName $lastName',
                )
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.3, curve: Curves.easeOut),

            const SizedBox(height: 20),

            ...[
                  MoreOptionTile(
                    icon: Icons.person_outline,
                    title: Text(S.of(context).profile),
                    onTap: () => context.pushNamed(Routes.profileScreen),
                  ),
                  MoreOptionTile(
                    icon: Icons.bookmark_border,
                    title: Text(S.of(context).favoriteCourses),
                    onTap: () => context.pushNamed(Routes.favorites),
                  ),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: (message) {
                          showCustomSnackbar(
                            context,
                            message: 'تم تسجيل الخروج بنجاح',
                          );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.login,
                            (route) => false,
                          );
                        },
                        failure: (message) {
                          showCustomSnackbar(context, message: message);
                        },
                        orElse: () {},
                      );
                    },
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      return MoreOptionTile(
                        icon: Icons.logout,
                        title: Text(S.of(context).logout),
                        trailing: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.mediumBlue,
                                  strokeWidth: 2,
                                ),
                              )
                            : null,
                        onTap: isLoading
                            ? null
                            : () {
                                context.read<LoginCubit>().logout();
                              },
                      );
                    },
                  ),
                ]
                .animate(interval: 120.ms)
                .slideX(begin: 0.3, curve: Curves.easeOut)
                .fadeIn(duration: 300.ms),
          ],
        ),
      ),
    );
  }
}
