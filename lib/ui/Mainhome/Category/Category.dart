import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final caption = [
    "Category 1",
    "Category 2",
    "Category 3",
    "Category 4",
    "Category 5",
    "Category 6",
    "Category 7",
    "Category 8",
    "Category 8",
    "Category 8",
    "Category 8",
    "Category 8",
  ];

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
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: mHeight * .03, left: mHeight * .02, right: mHeight * .02),
        child: Column(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () {},
              child: GridView.builder(
                itemCount: caption.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 15),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            print("worked btn");
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (ctx) => ScreenSubCategory()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffDAF6FF),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                  "https://cdn.shopify.com/s/files/1/1684/4603/products/iphone-12-pro_Graphite.png?v=1652856493",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mHeight * .01,
                      ),
                      Text(caption[index])
                    ],
                  );
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
