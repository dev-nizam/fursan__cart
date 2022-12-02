
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/home/AppBar/Screenfavourites.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenCart.dart';

class WidgetAppBar extends StatefulWidget {
  const WidgetAppBar({Key? key}) : super(key: key);

  @override
  State<WidgetAppBar> createState() => _WidgetAppBarState();
}

class _WidgetAppBarState extends State<WidgetAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => ScreenFavourites()));
          },
          icon: Icon(Icons.favorite_border),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => ScreenCart()));
          },
          icon: Icon(Icons.shopping_cart_outlined),
          color: Colors.black,
        ),
      ],
    );
  }
}
