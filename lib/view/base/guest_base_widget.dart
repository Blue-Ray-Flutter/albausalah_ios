import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants/constant_data/constant_data.dart';
import '../../shared/components/constants/nav_screen/nav_screen.dart';
import '../../shared/components/constants/style/color.dart';
import '../../shared/components/widgets/header_widget/guest_header_widget.dart';

class GuestBaseWidget extends StatefulWidget {
  const GuestBaseWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<GuestBaseWidget> createState() => _GuestBaseWidgetState();
}

class _GuestBaseWidgetState extends State<GuestBaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        splashRadius: 50,
        notchMargin: 0,
        elevation: 50,
        height: 75,
        activeIndex: guestBottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.sharpEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: (index) => setState(() => guestBottomNavIndex = index),
        itemCount: guestNavScreens.length,
        tabBuilder: (int index, bool isActive) {
          final color =
              isActive ? AppColor.globalDefaultColor : Colors.grey[400];
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                guestNavScreens[index].icon,
                size: 28,
                color: color,
              ),
              const SizedBox(height: 4),
              Text(
                guestNavScreens[index].name,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
        //other params
      ),
      body: Stack(
        children: [
          guestNavScreens[guestBottomNavIndex].widget,
          guestNavScreens[guestBottomNavIndex].navBarItem == NavBarItem.home
              ? GuestHeaderWidget(
                  containerSize: 100,
                )
              : GuestHeaderWidget(
                  onPressed: () {
                    setState(() {
                      guestBottomNavIndex = 0;
                    });
                  },
                  centerTitle: true,
                  containerSize: 100,
                  title: guestNavScreens[guestBottomNavIndex].name,
                  haveMore: false,
                  haveFav: false,
                  haveBack: true,
                  haveLocation: false,
                  haveLogo: false,
                ),
        ],
      ),
    );
  }
}
