
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/banner/BannerModel.dart';
import 'package:fursan_cart/repository/bloc/banner/banner_bloc.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenProductdetails.dart';
import 'package:fursan_cart/ui/home/bestoffer/ScreenBestOffers.dart';

class BestOffHome extends StatefulWidget {
  const BestOffHome({Key? key}) : super(key: key);

  @override
  State<BestOffHome> createState() => _BestOffHomeState();
}

class _BestOffHomeState extends State<BestOffHome> {
   late List<BannerModel>bestoffers;
  late List<BannerModel>bannermodel;
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BannerBloc>(context).add(FetchBanner());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<BannerBloc, BannerState>(
  builder: (context, state) {
    if (state is BannerLoading) {
      print(" best offers State.........Loading");
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is BannerError) {
      print(" best offers State.........Error");
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
      print(" best offers state loaded.......");
      // notificationModelClass = BlocProvider.of<NotificationBloc>(context)
      //     .notificationModelClass;
       bestoffers=
          BlocProvider
              .of<BannerBloc>(context)
              .bestOffers;
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: mWidth * .04,
                ),
                const Text(
                  "Best Offers",
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: mWidth * .53,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const BestOffers()));
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

                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 17),
                            child: Container(
                              height: mHeight * .4,
                              width: mWidth * .37,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "http://192.168.1.9:3010/api" +
                                              "/banner/images/" + bestoffers[index].banner![0].url.toString()),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 0,
                            bottom: 10,
                            child: ClipPath(
                              clipper: CustomPath(),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: const Color(0xFFD70C4B),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: 90,
                                height: 30,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 8,
                            bottom: 145,
                            right: 100,
                            child: RotationTransition(
                              turns:
                              const AlwaysStoppedAnimation(322 / 360),
                              child: Container(
                                child: const Text(
                                  "Best off",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return const SizedBox(
                        width: 1,
                      );
                    },
                    itemCount: bestoffers.length)),
            SizedBox(
              height: mHeight * .02,
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

class CustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = new Path();
    path.lineTo(size.width - 40, 0);
    path.lineTo(size.width - 150, size.height / 2);
    path.lineTo(size.width - 90, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
