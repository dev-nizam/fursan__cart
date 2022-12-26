
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/home/AppBar/Cart.dart';
import 'package:fursan_cart/ui/home/Brand/BrandHome.dart';
import 'package:fursan_cart/ui/home/SearchBarhome/SearchBarhome.dart';
import 'package:fursan_cart/ui/home/TrendingNow/TrendingHome.dart';
import 'package:fursan_cart/ui/home/bestoffer/BestOffHome.dart';


import '../home/AppBar/Screenfavourites.dart';
import '../home/Banner/BannerHome.dart';

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
                image: AssetImage("asset/logo/Logo1.png"),
                fit: BoxFit.fill)),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) =>  ScreenFavourites()));
          },
          icon: const Icon(Icons.favorite_border),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => const Cart()));
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
                SearchBarHome(),
                BannerHome(),
                SizedBox(
                  height: mHeight * .015,
                ),
                BrandHome(),
                TrendingHome(),
                SizedBox(
                  height: mHeight * .015,
                ),
                BestOffHome(),
              ],
            ),
          ],
        ));
  }
}
String mainApi="http://fursancart.rootsys.in/api";
// String mainApi="192.168.1.9:310/api";