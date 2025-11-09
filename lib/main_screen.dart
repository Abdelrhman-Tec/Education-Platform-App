import 'package:education_platform_app/core/theme/app_colors.dart';
import 'package:education_platform_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  final String name;
  const MainScreen({super.key, required this.name});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  int cartItemCount = 5;

  late final List<Widget> _screens = [
    HomeScreen(name: widget.name),
    PlaceholderScreen(title: "التصنيفات"),
    PlaceholderScreen(title: "الدورات"),
    PlaceholderScreen(title: "سلة المشتريات"),
    PlaceholderScreen(title: "المزيد"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _navItem(
    IconData icon,
    String label, {
    Widget? badge,
  }) {
    return BottomNavigationBarItem(
      icon: badge ?? Icon(icon, size: 28.sp),
      label: label,
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: AppColors.mediumBlue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            _navItem(Icons.home, "الرئيسية"),
            _navItem(Icons.category, "التصنيفات"),
            _navItem(Icons.school, "الدورات"),
            _navItem(
              Icons.shopping_cart,
              "سلة المشتريات",
              badge: Stack(
                children: [
                  Icon(Icons.shopping_cart, size: 28.sp),
                  if (cartItemCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16.w,
                          minHeight: 16.h,
                        ),
                        child: Text(
                          '$cartItemCount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            _navItem(Icons.more_horiz, "المزيد"),
          ],
        ),
      ),
    );
  }
}

// وده ويدجت مؤقت لكل شاشة غير موجودة
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title, style: TextStyle(fontSize: 24.sp)),
    );
  }
}
