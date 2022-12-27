
import 'package:flutter/material.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenDeliveryAddress.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenPaymentMethods.dart';

class ScreenBuyNow extends StatefulWidget {
  ScreenBuyNow({Key? key, required this. productDetailsModel}) : super(key: key);
  ProductDetailsModel productDetailsModel;
  @override
  State<ScreenBuyNow> createState() => _ScreenBuyNowState();
}

class _ScreenBuyNowState extends State<ScreenBuyNow> {
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
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text(
            "Order",
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: [
          SizedBox(
            height: mHeight * .3,
            width: mWidth,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: mHeight * .17,
                  width: mWidth * .35,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://fursancart.rootsys.in/api" +
                                  "/product/images/" +
                                  widget.productDetailsModel.images!.first.url
                                      .toString()),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: mHeight * .1,
                  width: mWidth * .5,
                  child: Text(
                    widget.productDetailsModel.name.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),
          SizedBox(
            height: mHeight * .015,
          ),
          Row(
            children: [
              SizedBox(
                width: mWidth * .15,
              ),
              const Text("Total  -  "),
              const Text(
                "1 item",
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                width: mWidth * .28,
              ),
              const Text("INR  "),
               Text(widget.productDetailsModel.price.toString()),
            ],
          ),
          SizedBox(
            height: mHeight * .015,
          ),
          const Divider(
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),
          SizedBox(
            height: mHeight * .04,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: mWidth * .1),
                height: mHeight * .12,
                width: mWidth * .45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Delivery Address",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: mHeight * .01,
                    ),
                    const Text(
                      "Jalan Haji Juanda No 1Paledang, Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mWidth * .17,
              ),
              SizedBox(
                height: mHeight * .05,
                width: mWidth * .2,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const ScreenDeliveryAddress()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white, //background color of button
                      side: const BorderSide(
                          width: 1,
                          color: Colors.grey), //border width and color
                      //content padding inside button
                    ),
                    child: const Text(
                      "Change",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: mHeight * .04,
          ),
          Row(
            children: [
              SizedBox(
                width: mWidth * .1,
              ),
              const Text(
                "Payment Method",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: mHeight * .02,
              ),
              Container(
                margin: EdgeInsets.only(left: mWidth * .06, top: mHeight * .01),
                height: mHeight * .07,
                width: mWidth * .18,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/PaymentLogo/mastercard logo"),
                      fit: BoxFit.contain),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "**** **** **** ",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "3677",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                width: mWidth * .185,
              ),
              SizedBox(
                height: mHeight * .05,
                width: mWidth * .2,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const ScreenPaymentMethods()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white, //background color of button
                      side: const BorderSide(
                          width: 1,
                          color: Colors.grey), //border width and color
                      //content padding inside button
                    ),
                    child: const Text(
                      "Change",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: mHeight * .06,
          ),
          SizedBox(
            height: mHeight * .07,
            width: mWidth * .8,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: const Color(0xff264050), //background color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Order Now",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                )),
          ),
        ],
      ),
    );
  }
}
