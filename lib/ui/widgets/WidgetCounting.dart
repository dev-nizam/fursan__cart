import 'package:flutter/material.dart';

class WidgetCounting extends StatefulWidget {
  const WidgetCounting({Key? key}) : super(key: key);

  @override
  State<WidgetCounting> createState() => _WidgetCountingState();
}

class _WidgetCountingState extends State<WidgetCounting> {
  int Quantity = 1;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: mHeight * .05,
          width: mWidth * .35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (Quantity > 1) {
                    setState(() {
                      Quantity--;
                    });
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    height: mHeight * .032,
                    width: mWidth * .08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all()),
                    child: Icon(
                      Icons.remove,
                      size: 20,
                    )),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: mWidth * .01),
                    height: mHeight * .032,
                    width: mWidth * .13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all()),
                    child: Text(
                      Quantity.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Quantity++;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: mWidth * .01),
                  height: mHeight * .032,
                  width: mWidth * .08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all()),
                  child: Icon(
                    Icons.add,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
