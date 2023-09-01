import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_skygoal/constants/colors.dart';
import 'package:flutter_task_skygoal/views/views/collageListview.dart';
import 'package:flutter_task_skygoal/views/views/home.dart';
import 'package:flutter_task_skygoal/views/views/otherViews/OtherViews.dart';

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  int currentIndex = 0;
  String _currentPageName = 'home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();

    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  Widget build(BuildContext context) {
    const page = [Home(), saved2(), Saved(), accountView()];
    final tabs = {
      'home': Home(),
      'saver_1': saved2(),
      'saver_2': Saved(),
      'Account': accountView(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
        // body: PageView(
        //   children: [
        //     page[currentIndex],
        //   ],
        // ),
        body: _currentPage ?? tabs[_currentPageName],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: defaultColor,
            elevation: 0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(color: white),
            selectedItemColor: white,
            unselectedItemColor: grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                _currentPage = null;
                _currentPageName = tabs.keys.toList()[value];

                //  currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                tooltip: 'Search',
                label: 'Search',
                activeIcon: Icon(
                  Icons.home_filled,
                  color: white,
                ),
                icon: Icon(
                  Icons.home_filled,
                  color: grey,
                ),
              ),
              BottomNavigationBarItem(
                tooltip: 'Saved',
                label: 'Saved',
                activeIcon: Image.asset(
                  'assets/home/save_img.png',
                  color: white,
                ),
                icon: Image.asset(
                  'assets/home/save_img.png',
                  color: grey,
                ),
              ),
              BottomNavigationBarItem(
                tooltip: 'Saved',
                label: 'Saved',
                activeIcon: Icon(
                  Icons.data_saver_off,
                  color: white,
                ),
                icon: Icon(
                  Icons.data_saver_off,
                  color: grey,
                ),
              ),
              BottomNavigationBarItem(
                tooltip: 'Account',
                label: 'Account',
                activeIcon: Icon(
                  Icons.person,
                  color: white,
                ),
                icon: Icon(
                  Icons.person,
                  color: grey,
                ),
              ),
            ]));
  }
}
