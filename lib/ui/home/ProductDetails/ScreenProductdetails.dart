
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/repository/bloc/ProductDetails/product_details_bloc.dart';

import 'package:fursan_cart/ui/home/ProductDetails/ScreenCart.dart';
import 'package:fursan_cart/ui/widgets/WidgetCounting.dart';
import 'package:fursan_cart/ui/widgets/WidgetStar.dart';

import '../../Mainhome/home.dart';
import 'ScreenBuyNow.dart';

class ScreenProductDetails extends StatefulWidget {
   ScreenProductDetails({Key? key, required this.productDetailsModel,}) : super(key: key);
  final ProductDetailsModel productDetailsModel;
  @override
  State<ScreenProductDetails> createState() => _ScreenProductDetailsState();
}

class _ScreenProductDetailsState extends State<ScreenProductDetails> {

  int Quantity = 1;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                height: mHeight * .32,
                width: mWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(mainApi +
                            "/product/images/" +widget.productDetailsModel.images![0].url.toString()
                          ),
                        fit: BoxFit.contain)),
              ),
              SizedBox(
                height: mHeight * .02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .05,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.productDetailsModel.name.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: mHeight * .001,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: mWidth * .02,
                      ),
                      Icon(
                        Icons.currency_rupee_rounded,
                        color: Colors.grey,
                        size: 14,
                      ),
                      Text(
                        widget.productDetailsModel.price.toString(),
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .1,
                  ),
                  WidgetStar(),
                ],
              ),
              Divider(
                thickness: 1,
                indent: 40,
                endIndent: 40,
              ),
              SizedBox(
                height: mHeight * .058,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: mWidth * .13, top: mHeight * .01),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.productDetailsModel.discPerQtt![index].qttFrom
                                    .toString(),
                                style: const TextStyle(fontSize: 15),
                              ),
                              const Text(
                                " - ",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                widget.productDetailsModel.discPerQtt![index].qttTo
                                    .toString(),
                                style: const TextStyle(fontSize: 15),
                              ),
                              const Text(
                                "sets",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mHeight * .002,
                          ),
                          Row(
                            children: [
                              const Text(
                                "₹",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(
                                width: mWidth * .012,
                              ),
                              Text(
                                widget.productDetailsModel.discPerQtt![index]
                                    .discFlatAmnt
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: mWidth * .01,
                    );
                  },
                  itemCount: 3,
                ),
              ),
              SizedBox(
                height: mHeight * .01,
              ),
              Divider(
                thickness: 1,
                indent: 40,
                endIndent: 40,
              ),
              WidgetCounting(),
              SizedBox(
                height: mHeight * .02,
              ),
              SizedBox(
                height: mHeight * .07,
                width: mWidth * .8,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => ScreenCart()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color(0xff264050), //background color of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "ADD TO CART",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )),
              ),
              SizedBox(
                height: mHeight * .005,
              ),
              SizedBox(
                height: mHeight * .07,
                width: mWidth * .8,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => ScreenBuyNow()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color(0xffFFC113), //background color of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "BUY NOW",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )),
              ),
              SizedBox(
                height: mHeight * .02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .1,
                  ),
                  Text(
                    "Product Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(left: mWidth * .05, top: mHeight * .005),
                height: mHeight * .2,
                width: mWidth * .85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                widget.productDetailsModel!.description.toString()                  )],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .1,
                  ),
                  Text(
                    "Rating & Reviews",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ],
              ),
              SizedBox(
                height: mHeight * .01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .1,
                  ),
                  WidgetStar(),
                ],
              ),
              SizedBox(
                height: mHeight * .005,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .1,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: mHeight * .01,
                      ),
                      Text(
                        "Value for money",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60, top: 5),
                        child: Text(
                          "Shafeek",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: mHeight * .02,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ));

  }
  List  Images=[
    "https://rukminim1.flixcart.com/image/416/416/xif0q/air-conditioner-new/e/l/b/-original-imaggf36gs6p98gf.jpeg?q=70",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThaOZA4ek6wxHP_CeBYe40AaZD2e6S2oz-v4wZrvKNMonOqkhZxTUR0sDsAHrfPlr8-CE&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDzZQ7Q8sL3hRw68ucAF9f2EIo9P4iSRbT9bvHGkwvY5-8jnhCjOI-fIrVLA0GQ2Fjhfo&usqp=CAU",
  ];
  List  NAME=[
    "ac",
    "LG 190 L Single Door Refrigerator with Smart Inverter Compressor in Scarlet Charm Color",
    "LG Urbane LTE Smart Watch - Silver",
  ];
  List  Price=[
    "2000",
    "5000",
    "1000",
  ];

List cart=[

];
}
