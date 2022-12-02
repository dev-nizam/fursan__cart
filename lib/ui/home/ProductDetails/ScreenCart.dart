
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/widgets/WidgetCounting.dart';
import 'package:fursan_cart/ui/widgets/WidgetStar.dart';

class ScreenCart extends StatefulWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  int Quantity = 1;
  bool checkBoxValue = true;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: mHeight,
            color: Colors.white,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Container(
                    height: mHeight * .205,
                    width: mWidth,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: mWidth * .06,
                                ),
                                Container(
                                  height: mHeight * .15,
                                  width: mWidth * .35,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "asset/products/Tv Samsung.png"))),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: mHeight * .03,
                            ),
                            Container(
                              height: mHeight * .1,
                              width: mWidth * .5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: mHeight * .02,
                                  ),
                                  Text(
                                    'Television 32" Smart TV',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: mHeight * .005,
                                  ),
                                  WidgetStar(),
                                  SizedBox(
                                    height: mHeight * .01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.currency_rupee_rounded,
                                        color: Colors.grey,
                                        size: 14,
                                      ),
                                      Text(
                                        "50000",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                WidgetCounting(),
                                SizedBox(
                                  width: mWidth * .17,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.close, size: 19),
                            SizedBox(
                              height: mHeight * .05,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider(
                    thickness: 1,
                  );
                },
                itemCount: 10),
          ),
          Positioned(
            top: mHeight * .82,
            child: Container(
              height: mHeight * .08,
              width: mWidth,
              color: Color(0xffF2F2F2),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: mWidth * .1),
                    height: mHeight * .06,
                    width: mWidth * .4,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Delivery Charge"),
                            Text("  ₹ "),
                            Text("100"),
                          ],
                        ),
                        SizedBox(
                          height: mHeight * .005,
                        ),
                        Row(
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "  ₹ ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "71500",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: mWidth * .13,
                  ),
                  SizedBox(
                    height: mHeight * .05,
                    width: mWidth * .32,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary:
                              Color(0xffFF7322), //background color of button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          "Place Order",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
