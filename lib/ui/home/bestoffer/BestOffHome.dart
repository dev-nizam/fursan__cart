
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenProductdetails.dart';
import 'package:fursan_cart/ui/home/bestoffer/ScreenBestOffers.dart';

class BestOffHome extends StatefulWidget {
  const BestOffHome({Key? key}) : super(key: key);

  @override
  State<BestOffHome> createState() => _BestOffHomeState();
}

class _BestOffHomeState extends State<BestOffHome> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: mWidth * .53,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const BestOffers()));
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const ScreenProductDetails()));
                },
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
                                  color: Colors.grey.withOpacity(.25),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Container(
                                    height: mHeight * .14,
                                    width: mWidth,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.y0S49mbJJrew6_aXE46fpAHaEo%26pid%3DApi&f=1&ipt=786988322468856a8549b48d1e8419b3d1e84a78ad65a6aa833c8a838e83f4b4&ipo=images"),
                                            fit: BoxFit.fill)),
                                  ),
                                  Container(
                                    height: mHeight * .007,
                                    color: const Color(0xffFFC113),
                                  ),
                                  Container(
                                    height: mHeight * .06,
                                    width: mWidth,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffE2E2E2),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: mHeight * .015,
                                        ),
                                        const Text(
                                          "Big Deals",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "Up to 10% off",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: mHeight * .12,
                            left: mWidth * .07,
                            child: Container(
                              height: mHeight * .04,
                              width: mWidth * .32,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.70),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mWidth * .02,
                                  ),
                                  const Text(
                                    "Television",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  SizedBox(
                                    width: mWidth * .015,
                                  ),
                                  Container(
                                    height: mHeight * .025,
                                    width: mWidth * .005,
                                    color: const Color(0xffFFC113),
                                  ),
                                  SizedBox(
                                    width: mWidth * .045,
                                  ),
                                  Container(
                                    height: mHeight * .03,
                                    width: mWidth * .07,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFFC113),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "asset/brand icons/image 3.png"),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(5)),
                                  )
                                ],
                              ),
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
                                // child: Text(
                                //   "best off",
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       fontSize: 50,
                                //       color: Colors.black),
                                // ),
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
                              turns: const AlwaysStoppedAnimation(322 / 360),
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
                    itemCount: 10),
              )),
          SizedBox(
            height: mHeight * .02,
          ),
        ],
      ),
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
