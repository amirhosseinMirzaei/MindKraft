import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindkraft/core/theme/app_colors.dart';
import 'package:mindkraft/features/home/presentation/pages/home_page.dart';
import 'package:mindkraft/features/profile/presentation/views/profile_screen.dart';

import '../../features/document/presentation/DocumentUploaderPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double heightBottomNavigation = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();

  final List<int> _history = [];
  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey
  };
  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
    map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: heightBottomNavigation,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (context) => HomePage()),
                  ),
                  Navigator(
                    key: _articleKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                        builder: (context) => ProfilePage()),
                  ),
                  Navigator(
                    key: _searchKey,
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (context) => DocumentUploaderPage()),
                  ),

                ],
              ),
            ),
            Positioned(
              bottom: 13,
              left: 12,
              right: 12,
              child: CustomBottomNavigation(
                onTap: (int index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
                selectedIndex: selectedScreenIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Screen',
      ),
    );
  }
}

class CustomBottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const CustomBottomNavigation({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 16,
            right: 16,
            bottom: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _BottomNavigationItem(
                    icon: Icons.home,
                    title: 'Home',
                    isActive: selectedIndex == 0,
                    onTap: () => onTap(0),
                  ),
                  SizedBox(width: 60), // فاصله برای دکمه وسط
                  _BottomNavigationItem(
                    icon: Icons.person,
                    title: 'Profile',
                    isActive: selectedIndex == 1,
                    onTap: () => onTap(1),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            child: GestureDetector(
              onTap: () => onTap(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.secondary, // نارنجی
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: Center(
                  child: Icon(Icons.edit, color: Colors.white), // آیکون قلم
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _BottomNavigationItem({
    required this.icon,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    final activeColor = AppColors.secondary;
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? activeColor: color ),

          Text(
            title,
            style: TextStyle(color: isActive? AppColors.secondary: color, fontSize: isActive? 14: 12,fontWeight: isActive?FontWeight.bold : FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
