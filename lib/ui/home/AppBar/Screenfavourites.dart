
import 'package:flutter/material.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/ui/widgets/ProductView.dart';
import 'package:fursan_cart/ui/widgets/favourites/favouritesView.dart';

import 'Cart.dart';

class ScreenFavourites extends StatefulWidget {
  const ScreenFavourites({Key? key}) : super(key: key);

  @override
  State<ScreenFavourites> createState() => _ScreenFavouritesState();
}

class _ScreenFavouritesState extends State<ScreenFavourites> {
  late List<ProductDetailsModel> productDetailsModel;
  // late List<ProductDetailsModel>  Tranding;
  bool search = true;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 0,
          title: search
              ? Text(
                  "Favourites",
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
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Cart()));
              },
              icon: Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
            ),
          ],
        ),
        body: FavouritesView());
  }
}
