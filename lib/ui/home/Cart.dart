import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool checkBoxValue = true;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: mHeight,
        color: Colors.white,
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (ctx, index) {
              return Container(
                height: mHeight * .205,
                width: mWidth,
                color: Colors.white,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: mWidth * .04,
                            ),
                            Center(
                              child: Container(
                                height: mHeight * .025,
                                width: mWidth * .06,
                                child: Checkbox(
                                    value: checkBoxValue,
                                    activeColor: Colors.black,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        checkBoxValue = newValue!;
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: mWidth * .06,
                            ),
                            Container(
                              height: mHeight * .15,
                              width: mWidth * .35,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("asset/Tv Samsung.png"))),
                            ),
                          ],
                        ),
                      ],
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
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 14,
                              ),
                              Icon(
                                Icons.star_border,
                                size: 14,
                              )
                            ],
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Icon(Icons.close, size: 19),
                        SizedBox(
                          height: mHeight * .05,
                        ),
                      ],
                    )
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
      ),
    );
  }
}
