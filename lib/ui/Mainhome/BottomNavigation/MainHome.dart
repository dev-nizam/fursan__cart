import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/Mainhome/BottomNavigation/BottomNavigation.dart';
import 'package:fursan_cart/ui/Mainhome/home.dart';

import '../Account/Account.dart';
import '../Category/Category.dart';
import '../Order/Order.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final pages = [Home(), Category(), Order(), Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: WidgetBottomNavigation(onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      }),
    );
  }
}
