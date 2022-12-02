
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenProductdetails.dart';
import 'package:fursan_cart/ui/widgets/WidgetStar.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
          "My Orders",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (ctx, index) {
            return Container(
              height: mHeight * .205,
              width: mWidth,
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: mWidth * .05,
                  ),
                  Container(
                    height: mHeight * .17,
                    width: mWidth * .35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("asset/products/Tv Samsung.png"))),
                  ),
                  Container(
                    height: mHeight * .11,
                    width: mWidth * .46,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: mHeight * .01,
                        ),
                        Text(
                          'Delivered on sep 29',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: mHeight * .01,
                        ),
                        Text(
                          'Television 32" Smart TV',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: mHeight * .01,
                        ),
                        WidgetStar(),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenProductDetails()));
                      },
                      icon: Icon(Icons.arrow_forward_ios))
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
    );
  }
}
