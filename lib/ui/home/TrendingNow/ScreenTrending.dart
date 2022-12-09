
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/widgets/ProductView.dart';

import '../AppBar/Cart.dart';
import '../AppBar/Screenfavourites.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

bool search = false;

class _TrendingState extends State<Trending> {
  bool search = true;
  @override
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.black,
        ),
        title: search
            ? Text(
                "Trending Now",
                style: TextStyle(color: Colors.black),
              )
            : Container(
                height: mHeight * .045,
                width: mWidth * .8,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: mHeight * .01),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(.2),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                search = !search;
              });
            },
            icon: search ? Icon(Icons.search) : Icon(Icons.close),
            color: Colors.black,
          ),
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
                  context, MaterialPageRoute(builder: (ctx) => Cart()));
            },
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: ProductView(),
    );
  }
}
