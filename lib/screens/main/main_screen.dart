import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/screens/main/favourites/Favorites.dart';
import 'package:grocery_app/screens/main/home/home.dart';
import 'package:grocery_app/screens/main/profile/profile.dart';
import 'package:grocery_app/screens/main/orders/orders.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';
import 'package:logger/logger.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    Home(),
    Favorites(),
    Orders(),
    Profile(),
  ];

//Store selected Screen value
  int activeIndex = 0;

  void onItemTapped(int i) {
    setState(() {
      activeIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar() ,
      bottomNavigationBar: Container(
        height: 83,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: SvgPicture.asset(
                AssetConstants.homeIcon,
                color:
                    activeIndex == 0 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () => onItemTapped(0),
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetConstants.favIcon,
                color:
                    activeIndex == 1 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () => onItemTapped(1),
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetConstants.menuIcon,
                color:
                    activeIndex == 2 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () => onItemTapped(2),
            ),
            InkWell(
              child: SvgPicture.asset(
                AssetConstants.profileIcon,
                color:
                    activeIndex == 3 ? AppColors.primaryColor : AppColors.kAsh,
              ),
              onTap: () => onItemTapped(3),
            ),
          ],
        ),
      ),
      body: _screens[activeIndex],
    );
  }
}
