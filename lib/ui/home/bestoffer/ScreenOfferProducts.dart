
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/banner/BannerModel.dart';
import 'package:fursan_cart/repository/bloc/ProductDetails/product_details_bloc.dart';
import 'package:fursan_cart/ui/Mainhome/home.dart';
import 'package:fursan_cart/ui/home/AppBar/Cart.dart';
import 'package:fursan_cart/ui/home/AppBar/Screenfavourites.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenProductdetails.dart';
import 'package:fursan_cart/ui/home/bestoffer/bestoffersProductView.dart';
import 'package:fursan_cart/ui/widgets/ProductView.dart';

class ScreenBestOffers extends StatefulWidget {
   ScreenBestOffers({Key? key, required this.bestoffers1, }) : super(key: key);

  final List<BannerModel>bestoffers1;

  @override
  State<ScreenBestOffers> createState() => _ScreenBestOffersState();
}

bool search = false;

class _ScreenBestOffersState extends State<ScreenBestOffers> {
  void initState() {
    BlocProvider.of<ProductDetailsBloc>(context).add(FatchBestoffersProduct());
    super.initState();
  }
  late List<ProductDetailsModel> productDetailsModel;
  late List<ProductDetailsModel>  Tranding;
  bool search = true;
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
          icon: Icon(Icons.arrow_back_outlined),
          color: Colors.black,
        ),
        title: search
            ? Text(
                widget.bestoffers1![0].bannerTitle!.toString(),
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
      body:BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
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
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {

                      Navigator.push(
                          context, MaterialPageRoute(builder: (ctx) => ScreenProductDetails(productDetailsModel: productDetailsModel[index])));
                    },
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
                                    image: NetworkImage(mainApi +
                                        "/product/images/"+ productDetailsModel[index].images![0].url.toString()

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
                                  productDetailsModel[index].name.toString(),maxLines: 1,
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
                                      productDetailsModel[index].price.toString(),maxLines: 2,
                                      style:
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
                itemCount: productDetailsModel.length);
          }

          return Container();
        },
      ),
    );
  }
}
