
import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenProductdetails.dart';
import 'package:fursan_cart/ui/widgets/WidgetStar.dart';

class WidgetFavourites extends StatefulWidget {
  const WidgetFavourites({Key? key}) : super(key: key);

  @override
  State<WidgetFavourites> createState() => _WidgetFavouritesState();
}

class _WidgetFavouritesState extends State<WidgetFavourites> {
  String selectedColor = "";
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => ScreenProductDetails()));
      },
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
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
                            image: AssetImage("asset/Home/Tv Samsung.png"))),
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
                        WidgetStar(),
                        Row(
                          children: [
                            Icon(
                              Icons.currency_rupee_rounded,
                              color: Colors.grey,
                              size: 14,
                            ),
                            Text(
                              "50000",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        selectedColor = index.toString();
                      },
                      child: Icon(
                          selectedColor == index.toString()
                              ? Icons.favorite_border
                              : Icons.favorite,
                          size: 19)),
                ],
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider(
              thickness: 1,
            );
          },
          itemCount: 10),
    );
  }
}
