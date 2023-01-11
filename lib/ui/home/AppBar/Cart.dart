
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/cart/CartViewModel.dart';
import 'package:fursan_cart/repository/bloc/cart/cart_bloc.dart';
import 'package:fursan_cart/ui/Mainhome/home.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenProductdetails.dart';
import 'package:fursan_cart/ui/widgets/WidgetStar.dart';
import 'package:fursan_cart/ui/widgets/favourites/FavouritesProductDetails.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CartBloc>(context).add(FetchCartView());

    super.initState();
  }
  late CartViewModel cartViewModel;
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
      body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              print("State.........");
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CartError) {
              return
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .9,
                    // color: Colors.red,
                    child: const Center(
                      child: Text("something went wrong"),
                    ),
                  ),

                );
            }
            if (state is CartLoaded) {
              print("state loaded.......");
              // notificationModelClass = BlocProvider.of<NotificationBloc>(context)
              //     .notificationModelClass;
              cartViewModel=
                  BlocProvider.of<CartBloc>(context). cartViewModel;


              return Column(
                children: [
                  Container(
                    height: mHeight * .8171,
                    color: Colors.white,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          FavouritesProductDetails(
                                            productssId:  cartViewModel
                                                .cartProducts![index].productsId
                                                .toString(),
                                          )));
                            },
                            child: Container(
                              height: mHeight * .205,
                              width: mWidth,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
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
                                                    image: NetworkImage(
                                                        mainApi +
                                                            "/product/images/" +
                                                            cartViewModel
                                                                .cartProducts![
                                                            index]
                                                                .product!
                                                                .images![index]
                                                                .url
                                                                .toString()))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: mHeight * .01,
                                          ),
                                          Container(
                                            height: mHeight * .13,
                                            width: mWidth * .47,
                                            // color: Colors.yellow,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: mHeight * .02,
                                                ),
                                                Text(
                                                  cartViewModel.cartProducts![index]
                                                      .product!.name
                                                      .toString(),
                                                  maxLines: 2,
                                                  style: const TextStyle(
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: mHeight * .005,
                                                ),
                                                const WidgetStar(),
                                                SizedBox(
                                                  height: mHeight * .01,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .currency_rupee_rounded,
                                                      color: Colors.grey,
                                                      size: 14,
                                                    ),
                                                    Text(
                                                      cartViewModel
                                                          .cartProducts![index]
                                                          .product!
                                                          .dicountAmount
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: mHeight * .05,
                                                    width: mWidth * .35,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {

                                                          },
                                                          child: Container(
                                                              alignment:
                                                              Alignment
                                                                  .center,
                                                              height: mHeight *
                                                                  .032,
                                                              width:
                                                              mWidth * .08,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      3),
                                                                  border: Border
                                                                      .all()),
                                                              child: const Icon(
                                                                Icons.remove,
                                                                size: 20,
                                                              )),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {},
                                                          child: Container(
                                                              alignment:
                                                              Alignment
                                                                  .center,
                                                              margin: EdgeInsets.only(
                                                                  left: mWidth *
                                                                      .01),
                                                              height: mHeight *
                                                                  .032,
                                                              width:
                                                              mWidth * .13,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      3),
                                                                  border: Border
                                                                      .all()),
                                                              child: Text(
                                                                Quantity
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                              )),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {

                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            margin:
                                                            EdgeInsets.only(
                                                                left:
                                                                mWidth *
                                                                    .01),
                                                            height:
                                                            mHeight * .032,
                                                            width: mWidth * .08,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    3),
                                                                border: Border
                                                                    .all()),
                                                            child: const Icon(
                                                              Icons.add,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // SizedBox(
                                              //   width: mWidth * .17,
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: mHeight * .15),
                                        height: mHeight * .05,
                                        width: mWidth * .1,
                                        // color: Colors.orange,
                                        child: IconButton(
                                            onPressed: () {

                                            },
                                            icon: const Icon(Icons.close,
                                                size: 25)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const Divider(
                            thickness: 1,
                          );
                        },
                        itemCount: cartViewModel.cartProducts!.length),
                  ),
                  Container(
                    height: mHeight * .08,
                    width: mWidth,
                    color: const Color(0xffF2F2F2),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: mWidth * .1),
                          height: mHeight * .06,
                          width: mWidth * .5,
                          // color: Colors.yellow,
                          child: Column(
                            children: [
                              // Row(
                              //   children: const [
                              //     Text("Delivery Charge"),
                              //     Text("  ₹ "),
                              //     Text("100"),
                              //   ],
                              // ),
                              SizedBox(
                                height: mHeight * .02,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Text(
                                    "  ₹ ",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    cartViewModel.totalPrice.toString(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   width: mWidth * .13,
                        // ),
                        SizedBox(
                          height: mHeight * .05,
                          width: mWidth * .32,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: const Color(
                                    0xffFF7322), //background color of button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Text(
                                "Place Order",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(
              child: Text("no response"),
            );
          }
      ),
    );
  }
}
