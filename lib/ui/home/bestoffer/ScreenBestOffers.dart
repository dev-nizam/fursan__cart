
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/home/bestoffer/ScreenOfferProducts.dart';
import 'package:fursan_cart/ui/widgets/WidgetAppBar.dart';

class BestOffers extends StatefulWidget {
  const BestOffers({Key? key}) : super(key: key);

  @override
  State<BestOffers> createState() => _BestOffersState();
}

class _BestOffersState extends State<BestOffers> {
  bool search = true;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                "Best Offers",
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
          WidgetAppBar(),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: mWidth * .05, right: mWidth * .05),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => ScreenBestOffers()));
          },
          child: GridView.builder(
              itemCount: 15,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: .80,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            height: mHeight * .17,
                            width: mWidth,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.y0S49mbJJrew6_aXE46fpAHaEo%26pid%3DApi&f=1&ipt=786988322468856a8549b48d1e8419b3d1e84a78ad65a6aa833c8a838e83f4b4&ipo=images"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                          ),
                          Container(
                            height: mHeight * .007,
                            color: Color(0xffFFC113),
                          ),
                          Container(
                            height: mHeight * .06565,
                            width: mWidth,
                            decoration: BoxDecoration(
                                color: Color(0xffE2E2E2),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: mHeight * .02,
                                ),
                                Text(
                                  "Big Deals",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Up to 10% off",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 125,
                      left: mWidth * .04,
                      child: Container(
                        height: mHeight * .05,
                        width: mWidth * .35,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.70),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: mWidth * .015,
                            ),
                            Text(
                              "Television",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              width: mWidth * .015,
                            ),
                            Container(
                              height: mHeight * .025,
                              width: mWidth * .005,
                              color: Color(0xffFFC113),
                            ),
                            SizedBox(
                              width: mWidth * .045,
                            ),
                            Container(
                              height: mHeight * .035,
                              width: mWidth * .08,
                              decoration: BoxDecoration(
                                  color: Color(0xffFFC113),
                                  image: DecorationImage(
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
                      left: 1,
                      top: 0,
                      bottom: 0,
                      child: ClipPath(
                        clipper: CustomPath(),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xFFD70C4B),
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
                      left: 19,
                      top: 0,
                      bottom: 160,
                      right: 100,
                      child: RotationTransition(
                        turns: new AlwaysStoppedAnimation(315 / 360),
                        child: Container(
                          child: Text(
                            "best off",
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
              }),
        ),
      ),
    );
  }
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
