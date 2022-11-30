
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/login/signin/signin.dart';
import 'package:fursan_cart/ui/login/signup/signup.dart';

class Hello extends StatefulWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mHeight * .1,
            ),
            Text(
              "      Hello!",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight:
                  FontWeight.lerp(FontWeight.w900, FontWeight.w900, 1.5),
                  fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: mHeight * .35,
              width: mWidth * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "asset/intro/hello.png"))),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "       Let's start your",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              "       next level shopping.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: mHeight * .05,
            ),
            Center(
              child: SizedBox(
                height: mHeight * .07,
                width: mWidth * .8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (ctx) => Signin()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffFFC113)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        // Change your radius here
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mHeight * .1,
            ),
            Center(
              child: Text(
                "Don't have Account?",
              ),
            ),
            SizedBox(
              height: mHeight * .02,
            ),
            Center(
              child: SizedBox(
                height: mHeight * .06,
                width: mWidth * .4,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (ctx) => Signup()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff264050)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        // Change your radius here
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
