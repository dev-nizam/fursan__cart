import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/brand/BrandModel.dart';
import 'package:fursan_cart/repository/bloc/ProductDetails/product_details_bloc.dart';
import 'package:fursan_cart/repository/bloc/brandMain/brand/brand_bloc.dart';
import 'package:fursan_cart/repository/bloc/brandMain/brandid/brandid_bloc.dart';

import '../AppBar/Cart.dart';
import '../AppBar/Screenfavourites.dart';

class ScreenBrand extends StatefulWidget {
   ScreenBrand({Key? key, required this.brandModel, }) : super(key: key);
final List<BrandModel> brandModel;
  @override
  State<ScreenBrand> createState() => _ScreenBrandState();
}

class _ScreenBrandState extends State<ScreenBrand> {
  void initState() {
  BlocProvider.of<BrandidBloc>(context).add(FatchBrandId());
  super.initState();
}

late List<ProductDetailsModel> productDetailsModel;
  bool search = true;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<BrandidBloc, BrandidState>(
  builder: (context, state) {
      if (state is BrandIdLoading) {
        print(" brand ui State.. loading.......");
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is BrandIdError) {
        print(" brand ui loaded..error...");
        return RefreshIndicator(
          onRefresh: () async {
            return BlocProvider.of<BrandBloc>(context)
                .add(FatchBrand());
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .9,
              // color: Colors.red,
              child: Center(
                child: Text("something went wrong"),
              ),
            ),
          ),
        );
      }


      if (state is BrandIdLoaded) {
        print(" brand ui state loaded.......");
        // notificationModelClass = BlocProvider.of<NotificationBloc>(context)
        //     .notificationModelClass;
        productDetailsModel=
            BlocProvider.of<BrandidBloc>(context).productDetailsModel;
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
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.black,
        ),
        title: search
            ? Text(
            widget.brandModel[0].name.toString(),
                style: TextStyle(color: Colors.black),
              )
            : Container(
                height: mHeight * .045,
                width: mWidth * .8,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: mHeight * .01),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(.2),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search),
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
            icon: search ? Icon(Icons.search) : Icon(Icons.close),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => ScreenFavourites()));
            },
            icon: Icon(Icons.favorite_border),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Cart()));
            },
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                                  image: AssetImage(
                                      "asset/products/Tv Samsung.png"))),
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
                              RatingBar.builder(
                                itemSize: 20,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
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
                                    "50000",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.favorite, color: Colors.orange, size: 19),
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider(
                    thickness: 1,
                  );
                },
                itemCount: 10,
              ),
            ],
          ),
        ],
      ),
    );
      }

      return Center(
        child: Text("no response"),
      );
    }
);
  }
}
