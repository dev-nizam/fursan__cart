
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/Mainhome/BottomNavigation/MainHome.dart';
import 'package:fursan_cart/ui/widgets/hello/hello.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> getSaveDate() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      print(prefs.getString('token'));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => MainHome()));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const Hello()));
    }
  }
  @override
  void initState() {
    splashFunc();
    super.initState();
  }
  // void initState() {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => const Hello()),
  //             (route) => false);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "asset/Splash/p05Artboard 2.png",
          width: mHeight * .47,
          height: mWidth * .47,
        ),
      ),
    );
  }
  Future splashFunc() async {
    Future.delayed(const Duration(seconds: 3), () {
      getSaveDate();
    });
  }
}