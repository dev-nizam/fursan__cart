
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/favorites/FavoritesModel.dart';
import 'package:fursan_cart/repository/bloc/ProductDetails/product_details_bloc.dart';
import 'package:fursan_cart/repository/bloc/favorites/favorites_bloc.dart';

import 'package:fursan_cart/ui/home/ProductDetails/ScreenCart.dart';
import 'package:fursan_cart/ui/widgets/WidgetCounting.dart';
import 'package:fursan_cart/ui/widgets/WidgetStar.dart';
import 'package:fursan_cart/ui/widgets/favourites/favouritesView.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
  int _current = 0;
  bool _hasBeenPressed = false;
  late FavoritesModel favoritesModel;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
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
                      itemCount: 2,
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
                                            widget.productDetailsModel.images![index].url
                                                .toString()),
                                    fit: BoxFit.contain)),
                          ),
                    ),
                  ),
                  Positioned(
                    left: mWidth * .8,
                    child: BlocListener<FavoritesBloc, FavoritesState>(
  listener: (context, state) {
    if (state is FavoriteLoading) {
      const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is FavoriteLoaded) {
      // BlocProvider.of<ProductBloc>(context)
      //     .add(FetchProduct(subId: widget.id));
      favoritesModel =
          BlocProvider.of<FavoritesBloc>(context).favoritesModel;
    }
    if (state is FavoriteError) {
      const Center(
        child: Text("something went wrong"),
      );
    }
    // TODO: implement listener
  },
  child: Container(
                      child: IconButton(
                          onPressed: () {
                            print(favoritesModel.productsId.toString());

                            setState(() {
                              _hasBeenPressed = !_hasBeenPressed;
                            },);
                            BlocProvider.of<
                                FavoritesBloc>(
                                context)
                                .add(Fetchfavorites(productid: favoritesModel.productsId.toString(), userid: favoritesModel.userId.toString()));


                          },
                          icon:  Icon(Icons.favorite,color: _hasBeenPressed ? Colors.black : Colors.yellowAccent, ),),
                    ),
),
                  )
                ],
              ),
              SizedBox(
                height: mHeight * .01,
              ),
              AnimatedSmoothIndicator(
                activeIndex: _current,
                count: widget.productDetailsModel.images!.length ,
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
                          widget.productDetailsModel.name.toString(),
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
                        widget.productDetailsModel.price.toString(),
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
                      primary:
                      const Color(0xff264050), //background color of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => ScreenBuyNow(
                                  productDetailsModel: widget.productDetailsModel)));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary:
                      const Color(0xffFFC113), //background color of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
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
                  const Text(
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
                    Text(widget.productDetailsModel.description.toString()),
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
