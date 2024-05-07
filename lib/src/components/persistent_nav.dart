import 'package:expense_tracker_app/screens/categories/categories.dart';
import 'package:expense_tracker_app/screens/dummy.dart';
import 'package:expense_tracker_app/screens/history.dart';
import 'package:expense_tracker_app/screens/home/home.dart';
import 'package:expense_tracker_app/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PersistentNav extends StatefulWidget {
  const PersistentNav({super.key});

  @override
  State<PersistentNav> createState() => _PersistentNavState();
}

class _PersistentNavState extends State<PersistentNav> {
  late PersistentTabController _controller;

  void _openRatingsLayer() {
    showModalBottomSheet(
      elevation: 0,
      backgroundColor: Colors.white,
      // isDismissible: true,
      // isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: const DummyScreen(),
        );
      },
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      CategoryScreen(),
      DummyScreen(),
      HistoryScreen(),
      SettingsScreen(),
    ];
  }

  int _currentIndex = 0;
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: Colors.orange.shade800,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.category_outlined),
        title: ("Category"),
        activeColorPrimary: Colors.orange.shade800,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          if (_currentIndex == 2) {
            _openRatingsLayer();
          } else {
            setState(() {
              _currentIndex =
                  2; // Set the current index to the index of the DummyScreen
            });
          }
        },
        icon: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
        title: ("Add"),
        activeColorPrimary: Colors.orange.shade800,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.calendar_today_outlined),
        title: ("Calendar"),
        activeColorPrimary: Colors.orange.shade800,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_outlined),
        title: ("Settings"),
        activeColorPrimary: Colors.orange.shade800,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.grey.shade200, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(35.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style16, // Choose the nav bar style with this property.
    );
  }
}
