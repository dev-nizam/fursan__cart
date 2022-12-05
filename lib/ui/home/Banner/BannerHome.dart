
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/banner/BannerModel.dart';
import 'package:fursan_cart/repository/bloc/banner/banner_bloc.dart';

class BannerHome extends StatefulWidget {
  const BannerHome({Key? key}) : super(key: key);

  @override
  State<BannerHome> createState() => _BannerHomeState();
}

class _BannerHomeState extends State<BannerHome> {
  // late List<BannerModel> bannerModel;
   late List<BannerModel> bannerimg ;

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BannerBloc>(context).add(FetchBanner());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery
        .of(context)
        .size
        .height;
    final mWidth = MediaQuery
        .of(context)
        .size
        .width;
    return BlocBuilder<BannerBloc, BannerState>(
        builder: (context, state) {
          if (state is BannerLoading) {
            print("State.........");
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is BannerError) {
            return RefreshIndicator(
              onRefresh: () async {
                return BlocProvider.of<BannerBloc>(context)
                    .add(FetchBanner());
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
          if (state is BannerLoaded) {
            print("state loaded.......");
            // notificationModelClass = BlocProvider.of<NotificationBloc>(context)
            //     .notificationModelClass;
            bannerimg=
                BlocProvider.of<BannerBloc>(context). bannerimg;


            return
              Container(
              child: Column(
                children: [
                  SizedBox(
                    height: mHeight * .02,
                  ),
                  Container(
                    height: mHeight * .2,
                    width: mWidth * .91,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: const Duration(
                            milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: bannerimg.length,
                      itemBuilder:
                          (BuildContext context, int index,
                          int pageViewIndex) =>
                          // bannerimg[index].banner == null ?
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * .29,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .90,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "http://192.168.1.9:3010/api" +
                                          "/banner/images/" +
                                         bannerimg[index].banner!
                                        .first
                                        .url
                                        .toString()),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                    ),
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