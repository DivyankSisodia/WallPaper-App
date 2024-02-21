import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/home.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Home home;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
