import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:pocketplans/screens/cart/cart_screen.dart';
import 'package:pocketplans/screens/home_screen.dart';
import 'package:pocketplans/screens/profile_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  int currentScreen = 0;
  late PageController controller;
  @override
  void initState() {
    super.initState();
    screens = [HomeScreen(), CartScreen(), ProfileScreen()];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: screens,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentScreen,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 10,
          height: kBottomNavigationBarHeight,
          onDestinationSelected: (index) {
            setState(() {
              currentScreen = index;
            });
            controller.jumpToPage(currentScreen);
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(IconlyLight.home),
                icon: Icon(IconlyLight.home),
                label: "Home"),
            NavigationDestination(
                selectedIcon: Icon(IconlyLight.bag2),
                icon: Icon(IconlyLight.bag2),
                label: "Cart"),
            NavigationDestination(
                selectedIcon: Icon(IconlyLight.profile),
                icon: Icon(IconlyLight.profile),
                label: "Profile")
          ],
        ));
  }
}
