
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/repository/bloc/ProductDetails/product_details_bloc.dart';
import 'package:fursan_cart/repository/bloc/ProductDetails/product_details_bloc.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenCart.dart';
import 'package:fursan_cart/ui/widgets/WidgetCounting.dart';
import 'package:fursan_cart/ui/widgets/WidgetStar.dart';

import 'ScreenBuyNow.dart';

class ScreenProductDetails extends StatefulWidget {
   ScreenProductDetails({Key? key, }) : super(key: key);

  @override
  State<ScreenProductDetails> createState() => _ScreenProductDetailsState();
}

class _ScreenProductDetailsState extends State<ScreenProductDetails> {

  late List<ProductDetailsModel> productDetailsModel;
  void initState() {
    BlocProvider.of<ProductDetailsBloc>(context).add(FatchProductDetails());
    super.initState();
  }
  int Quantity = 1;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
  builder: (context, state) {
      if (state is ProductDetailsLoading) {
        print("ProductDetailsLoading");
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ProductDetailsError) {
        print("ProductDetailsError");
        return const Center(
          child: Text("Something went wrong"),
        );
      }
      if (state is ProductDetailsLoaded) {
        print("ProductDetailsLoaded");
        productDetailsModel = BlocProvider.of<ProductDetailsBloc>(context).productDetailsModel;
    return ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                height: mHeight * .32,
                width: mWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.shopclues.com%2Fimages%2Fdetailed%2F79356%2F134614939-79356631-1519117435.jpg&f=1&nofb=1&ipt=85a16544077f3f929d51afed7ec595a5379c0079f69ba7e4ac701e5755c47e01&ipo=images"),
                        fit: BoxFit.contain)),
              ),
              SizedBox(
                height: mHeight * .02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .1,
                  ),
                  Column(
                    children: [
                      Text(
                        'Television 32" Smart TV',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: mHeight * .005,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: mWidth * .12,
                      ),
                      Icon(
                        Icons.currency_rupee_rounded,
                        color: Colors.grey,
                        size: 14,
                      ),
                      Text(
                        "50000",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
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
              Row(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: mWidth * .15, top: mHeight * .01),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "1 - 10",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
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
                            Text(
                              "₹",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              width: mWidth * .012,
                            ),
                            Text(
                              "50,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: mWidth * .11, top: mHeight * .01),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "1 - 10",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
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
                            Text(
                              "₹",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              width: mWidth * .012,
                            ),
                            Text(
                              "50,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: mWidth * .11, top: mHeight * .01),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "1 - 10",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
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
                            Text(
                              "₹",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            SizedBox(
                              width: mWidth * .012,
                            ),
                            Text(
                              "50,000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
                        "With this Samsung TV, every image on the screen comes to life, giving you a home theatre experience. With the HD visual quality of this TV, you can enjoy vibrant movie scenes. Additionally, HDR increases the screen's brightness and brings out the subtleties of the material. Moreover, the Contrast Enhancer on this TV improves contrast and offers superb image quality with increased depth."),
                  ],
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
      );
      }
      return Container();
    },
),
    );
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
