import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/favorites/FavoriteModel.dart';
import 'package:fursan_cart/repository/bloc/favorites/favorites_bloc.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenBuyNow.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenCart.dart';
import 'package:fursan_cart/ui/widgets/WidgetCounting.dart';
import 'package:fursan_cart/ui/widgets/WidgetStar.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FavouritesProductDetails extends StatefulWidget {
  FavouritesProductDetails({
    Key? key,
    required this.productssId,
  }) : super(key: key);
  final String productssId;
  @override
  State<FavouritesProductDetails> createState() =>
      _FavouritesProductDetailsState();
}

class _FavouritesProductDetailsState extends State<FavouritesProductDetails> {
  void initState() {
    // TODO: implement initState
    BlocProvider.of<FavoritesBloc>(context)
        .add(FetchFavouritesProductDetails(widget.productssId));

    super.initState();
  }
  late List<FavoriteModel> favoriteModel;
  late ProductDetailsModel productDetailsModel;

  int Quantity = 1;
  int _current = 0;
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
      if (state is FavoriteLoading) {
        print(" FavouritesProductDetails State Loading");
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is FavoriteError) {
        print("FavouritesProductDetails ui error");
        return const Center(
          child: Text("something went wrong"),
        );
      }
      if (state is FavoriteLoaded) {
        print("FavouritesProductDetails state loaded.......");

        favoriteModel =
            BlocProvider.of<FavoritesBloc>(context).favoritesModel;
        return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: mHeight * .3,
                        width: mWidth,
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                              height: 400,
                              aspectRatio: 2.0,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                          itemCount: productDetailsModel.images!.length,
                          itemBuilder: (BuildContext context, int index,
                                  int pageViewIndex) =>
                              Container(
                            height: MediaQuery.of(context).size.height * .29,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "http://fursancart.rootsys.in/api" +
                                          "/product/images/" +
                                          productDetailsModel.images![index].url
                                              .toString(),
                                    ),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: mWidth * .8,
                        child: Container(
                            // color: Colors.yellow,
                            child: IconButton(
                                onPressed: () {
                                  pressed = !pressed;
                                  BlocProvider.of<FavoritesBloc>(context).add(
                                      FetchFavouritesProductDetails(
                                          productDetailsModel.id.toString()));

                                },
                                icon: pressed
                                    ? const Icon(Icons.favorite_border)
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: mHeight * .01,
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: _current,
                    count: productDetailsModel.images!.length,
                    effect: const JumpingDotEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
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
                          SizedBox(
                            height: mHeight * .06,
                            width: mWidth * .61,
                            child: Text(
          productDetailsModel.name.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: mHeight * .005,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: mWidth * .04,
                          ),
                          const Text(
                            "₹",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey),
                          ),
                          Text(
          productDetailsModel.price.toString(),
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
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
                      const WidgetStar(),
                    ],
                  ),
                  const Divider(
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
          productDetailsModel.discPerQtt![index].qttFrom
                                        .toString(),
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const Text(
                                    " - ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                  productDetailsModel.discPerQtt![index].qttTo
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: mWidth * .012,
                                  ),
                                  Text(
          productDetailsModel.discPerQtt![index].discFlatAmnt
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
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
                  const Divider(
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                  ),
                  const WidgetCounting(),
                  SizedBox(
                    height: mHeight * .02,
                  ),
                  SizedBox(
                    height: mHeight * .07,
                    width: mWidth * .8,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const ScreenCart()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color(
                              0xff264050), //background color of button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "ADD TO CART",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (ctx) => ScreenBuyNow(
                          //             productModel: productModel)));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: const Color(
                              0xffFFC113), //background color of button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "BUY NOW",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
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
                      const Text(
                        "Product Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: mWidth * .05, top: mHeight * .005),
                    height: mHeight * .2,
                    width: mWidth * .85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(productDetailsModel.description.toString()),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: mWidth * .1,
                      ),
                      const Text(
                        "Rating & Reviews",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
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
                      const WidgetStar(),
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
                          const Text(
                            "Value for money",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 60, top: 5),
                            child: Text(
                              "Shafeek",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
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
          ),
        );
      }
      return const Center(
        child: Text("no response"),
      );
    });
  }
}
