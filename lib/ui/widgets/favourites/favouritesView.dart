
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/favorites/FavoriteModel.dart';


import 'package:fursan_cart/repository/bloc/favorites/favorites_bloc.dart';

class FavouritesView extends StatefulWidget {
  FavouritesView({Key? key,   }) : super(key: key);

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {

late FavoriteModel favoritesModel;
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


      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
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
                              image: NetworkImage(
                                  "http://192.168.1.9:3010/api" +
                                      "/product/images/" +
                                      favoritesModel.product!.images![0].url.toString()
                              )
                          )),
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
                            favoritesModel.product!.name!.toString()
                            , maxLines: 1,
                            style: TextStyle(fontSize: 14),
                          ),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) =>
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee_rounded,
                                color: Colors.grey,
                                size: 14,
                              ),
                              Text(
                                favoritesModel.product!
                                    .price!
                                    .toString(), maxLines: 2, style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.favorite, color: Colors.orange, size: 19),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider(
              thickness: 1,
            );
          },
          itemCount: Price.length);
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

