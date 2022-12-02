import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int selectedIndex = 0;

class WidgetBottomNavigation extends StatefulWidget {
  const WidgetBottomNavigation({Key? key, required this.onTap})
      : super(key: key);
  final Function(int) onTap;
  @override
  State<WidgetBottomNavigation> createState() => _WidgetBottomNavigationState();
}

class _WidgetBottomNavigationState extends State<WidgetBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: widget.onTap,
        elevation: 30,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home,color: Colors.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined,color: Colors.black,
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.basketShopping,color: Colors.black,
            ),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined
              ,color: Colors.black,
            ),
            label: "Account",
          ),
        ]);
  }
}
