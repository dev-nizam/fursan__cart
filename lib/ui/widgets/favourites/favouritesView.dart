
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/favorites/FavoriteModel.dart';


import 'package:fursan_cart/repository/bloc/favorites/favorites_bloc.dart';
import 'package:fursan_cart/ui/Mainhome/home.dart';
import 'package:fursan_cart/ui/home/AppBar/Cart.dart';
import 'package:fursan_cart/ui/widgets/WidgetStar.dart';
import 'package:fursan_cart/ui/widgets/favourites/FavouritesProductDetails.dart';

import '../../Mainhome/Category/subcategoryproducts.dart';
import '../../home/SearchBarhome/SearchPageHome.dart';

class FavouritesView extends StatefulWidget {
  FavouritesView({Key? key,   }) : super(key: key);

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {

late List< FavoriteModel >favoritesModel;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<FavoritesBloc>(context).add(Fetchfavoritesview());

    super.initState();
  }

Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<FavoritesBloc, FavoritesState>(
  builder: (context, state) {
    if (state is FavoriteLoading) {
      print("State....FavoriteLoading.....");
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is FavoriteError) {
      print("State....FavoriteError.....");
      return
        // RefreshIndicator(
        // onRefresh: () async {
        //   return BlocProvider.of<FavoritesBloc>(context)
        //       .add(Fetchfavoritesview());
        // // },
        // child:
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
    if (state is FavoriteLoaded) {
      print("state loaded..FavoriteLoaded.....");
      // notificationModelClass = BlocProvider.of<NotificationBloc>(context)
      //     .notificationModelClass;
      favoritesModel =
          BlocProvider
              .of<FavoritesBloc>(context)
              .favoritesModel;


      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 0,
          title: search
              ? const Text(
            "Favourites",
            style: TextStyle(color: Colors.black),
          )
              : GestureDetector(
            onTap: () {
              Navigator.push(
                  (context),
                  MaterialPageRoute(
                      builder: (context) => const SearchPageHome()));
            },
            child: SizedBox(
              height: mHeight * .045,
              width: mWidth * .8,
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: mHeight * .01),
                  filled: true,
                  enabled: false,
                  fillColor: Colors.grey.withOpacity(.2),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  search = !search;
                });
              },
              icon:
              search ? const Icon(Icons.search) : const Icon(Icons.close),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const Cart()));
              },
              icon: const Icon(Icons.shopping_cart_outlined),
              color: Colors.black,
            ),
          ],
        ),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => FavouritesProductDetails(
                            productssId: favoritesModel[index]
                                .productsId
                                .toString(),
                          )));
                },
                child: Container(
                  height: mHeight * .205,
                  width: mWidth,
                  child: Row(
                    children: [
                      SizedBox(
                        width: mWidth * .05,
                      ),
                      Container(
                        height: mHeight * .1,
                        width: mWidth * .35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "http://fursancart.rootsys.in/api" +
                                        "/product/images/" +
                                        favoritesModel[index]
                                            .product!
                                            .images![0]
                                            .url
                                            .toString()))),
                      ),
                      SizedBox(
                        height: mHeight * .2,
                        width: mWidth * .5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: mHeight * .02,
                            ),
                            Text(
                              favoritesModel[index].product!.name.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                            WidgetStar(),
                            Row(
                              children: [
                                const Icon(
                                  Icons.currency_rupee_rounded,
                                  color: Colors.grey,
                                  size: 14,
                                ),
                                Text(
                                  favoritesModel[index]
                                      .product!
                                      .price
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
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
            itemCount: favoritesModel.length),
      );

    }
    return Center(
    child: Text("no response"),
    );
  }
);
  }
  }

  List Images = [
    "https://rukminim1.flixcart.com/image/416/416/xif0q/air-conditioner-new/e/l/b/-original-imaggf36gs6p98gf.jpeg?q=70",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThaOZA4ek6wxHP_CeBYe40AaZD2e6S2oz-v4wZrvKNMonOqkhZxTUR0sDsAHrfPlr8-CE&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDzZQ7Q8sL3hRw68ucAF9f2EIo9P4iSRbT9bvHGkwvY5-8jnhCjOI-fIrVLA0GQ2Fjhfo&usqp=CAU",
  ];
  List NAME = [
    "ac",
    "LG 190 L Single Door Refrigerator ",
    "LG Urbane LTE Smart Watch - Silver",
  ];
  List Price = [
    "2000",
    "5000",
    "1000",
  ];

