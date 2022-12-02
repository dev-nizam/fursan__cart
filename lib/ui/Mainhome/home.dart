
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            height: mHeight * .055,
            width: mWidth * .38,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/intro/hello.png"),
                    fit: BoxFit.fill)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (ctx) => const ScreenFavourites()));
              },
              icon: const Icon(Icons.favorite_border),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (ctx) => const Cart()));
              },
              icon: const Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
            ),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                // SearchBarHome(),
                // BannerHome(),
                SizedBox(
                  height: mHeight * .015,
                ),
                // BrandHome(),
                // TrendingHome(),
                SizedBox(
                  height: mHeight * .015,
                ),
                // BestOffHome(),
              ],
            ),
          ],
        ));
  }
}