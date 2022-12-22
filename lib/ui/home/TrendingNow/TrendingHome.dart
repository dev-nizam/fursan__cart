
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/repository/bloc/ProductDetails/product_details_bloc.dart';
import 'package:fursan_cart/repository/bloc/trending/tranding_bloc.dart';
import 'package:fursan_cart/ui/Mainhome/home.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenProductdetails.dart';
import 'package:fursan_cart/ui/home/TrendingNow/ScreenTrending.dart';

class TrendingHome extends StatefulWidget {
   TrendingHome({Key? key, }) : super(key: key);

  @override
  State<TrendingHome> createState() => _TrendingHomeState();
}

class _TrendingHomeState extends State<TrendingHome> {
  void initState() {
    BlocProvider.of<TrandingBloc>(context).add(Fatchtrending());
    super.initState();
  }

    late List<ProductDetailsModel> productDetailsModel;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<TrandingBloc, TrandingState>(
      builder: (context, state) {
        if (state is TrandingLoading) {
          print("TrandingLoading");
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TrandingError) {
          print("TrandingError");
          return const Center(
            child: Text("Something went wrong"),
          );
        }
        if (state is TrandingLoaded) {
          print("TrandingLoaded");
          productDetailsModel = BlocProvider.of<TrandingBloc>(context).productDetailsModel;
          return Container(
            child: Column(
              children: [
                SizedBox(
                  height: mHeight * .015,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: mWidth * .04,
                    ),
                    const Text(
                      "Trending Now",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: mWidth * .47,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) =>  Trending(productDetailsModel: productDetailsModel, )));
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: mHeight * .015,
                ),
                Container(
                    height: mHeight * .21,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) =>  ScreenProductDetails(productDetailsModel: productDetailsModel[index])));
                              },
                              child: Container(
                                height: mHeight * .06,
                                width: mWidth * .37,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.10),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    productDetailsModel[index]
                                        .images!.isNotEmpty ?  Container(
                                      height: mHeight * .145,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                          ),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  mainApi +
                                                      "/product/images/" +
                                                      productDetailsModel[index]
                                                          .images![0].url.toString()),
                                              fit: BoxFit.fill)),
                                    ):Container(
                                height: mHeight * .145,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "asset/logo/Logo1.png"),
                                        fit: BoxFit.fill)),),
                                    Container(
                                      height: mHeight * .06,
                                      width: mWidth * .35,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productDetailsModel[index]
                                                .name
                                                .toString(),maxLines: 2,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                          // const Text(
                                          //   '32" Full HD',
                                          //   style:
                                          //       TextStyle(color: Colors.grey),
                                          // ),
                                          Row(
                                            children: [
                                              const Text(
                                                '\$',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                              SizedBox(
                                                width: mWidth * .01,
                                              ),
                                              Text(
                                                productDetailsModel[index]
                                                    .dicountAmount
                                                    .toString(),
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.redAccent,),
                                              ),
                                              Text(
                                                productDetailsModel[index]
                                                    .price
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const SizedBox(
                            width: 1,
                          );
                        },
                        itemCount: productDetailsModel.length >6? 6:productDetailsModel.length)),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
