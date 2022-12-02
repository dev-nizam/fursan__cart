

import 'package:flutter/material.dart';
import 'package:fursan_cart/ui/widgets/WidgetAppBar.dart';

class ScreenDeliveryAddress extends StatefulWidget {
  const ScreenDeliveryAddress({Key? key}) : super(key: key);

  @override
  State<ScreenDeliveryAddress> createState() => _ScreenDeliveryAddressState();
}

class _ScreenDeliveryAddressState extends State<ScreenDeliveryAddress> {
  int _value = 1;
  bool search = true;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
          "Select Delivery Address",
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
      body: Column(
        children: [
          SizedBox(
            height: mHeight * .03,
          ),
          RadioListTile(
            value: 1,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val!;
              });
            },
            activeColor: Colors.black,
            title: Text(
                "Jalan Haji Juanda No 1Paledang, Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat"),
          ),
          SizedBox(
            height: mHeight * .01,
          ),
          RadioListTile(
            value: 2,
            groupValue: _value,
            onChanged: (val) {
              setState(() {
                _value = val!;
              });
            },
            activeColor: Colors.black,
            title: Text(
                "Jalan Haji Juanda No 1Paledang, Kecamatan Bogor Tengah, Kota Bogor, Jawa Barat"),
          ),
        ],
      ),
    );
  }
}
