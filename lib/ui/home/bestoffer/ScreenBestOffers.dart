
import 'package:flutter/material.dart';
import 'package:fursan_cart/model/banner/BannerModel.dart';
import 'package:fursan_cart/ui/home/bestoffer/ScreenOfferProducts.dart';
import 'package:fursan_cart/ui/widgets/WidgetAppBar.dart';

class BestOffersfull extends StatefulWidget {
   BestOffersfull({Key? key, required this.bestoffers, }) : super(key: key);

   final List<BannerModel>bestoffers;
  @override
  State<BestOffersfull> createState() => _BestOffersfullState();
}

class _BestOffersfullState extends State<BestOffersfull> {
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
