import 'package:flutter/material.dart';

class ScreenPaymentMethods extends StatefulWidget {
  const ScreenPaymentMethods({Key? key}) : super(key: key);

  @override
  State<ScreenPaymentMethods> createState() => _ScreenPaymentMethodsState();
}

class _ScreenPaymentMethodsState extends State<ScreenPaymentMethods> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 40,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(Icons.arrow_back),
            ),
            color: Colors.black,
          ),
          title: Text(
            "Manage Payment Methods",
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: [
          Divider(
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),
          SizedBox(
            height: mHeight * .01,
          ),
          Row(
            children: [
              SizedBox(
                width: mWidth * .075,
              ),
              Text(
                "Cards",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: mHeight * .02),
            height: mHeight * .07,
            width: mWidth,
            // color: Colors.yellow,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: mWidth * .075),
                  height: mHeight * .05,
                  width: mWidth * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image:
                        AssetImage("asset/PaymentLogo/credit-card-logo-")),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: mWidth * .03,
                ),
                Text("Credit, Debit & ATM Cards"),
                SizedBox(
                  width: mWidth * .17,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: mHeight * .01),
            height: mHeight * .07,
            width: mWidth,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: mWidth * .075),
                  height: mHeight * .05,
                  width: mWidth * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage(
                            "asset/PaymentLogo/Sodexo_logo.5ffcf10e56ffe-2394331976")),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: mWidth * .03,
                ),
                Text("Sodexo Meal Pass"),
                SizedBox(
                  width: mWidth * .29,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: mHeight * .01,
          ),
          Divider(
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),
          SizedBox(
            height: mHeight * .01,
          ),
          Row(
            children: [
              SizedBox(
                width: mWidth * .075,
              ),
              Text(
                "UPI",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: mHeight * .02),
            height: mHeight * .07,
            width: mWidth,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: mWidth * .075),
                  height: mHeight * .05,
                  width: mWidth * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage("asset/PaymentLogo/Paytm-Logo")),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: mWidth * .03,
                ),
                Text("Paytm UPI"),
                SizedBox(
                  width: mWidth * .29,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: mHeight * .01),
            height: mHeight * .07,
            width: mWidth,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: mWidth * .075),
                  height: mHeight * .05,
                  width: mWidth * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage(
                            "asset/PaymentLogo/Google_Pay-Logo.wine-3985656376")),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: mWidth * .03,
                ),
                Text("Google Pay"),
                SizedBox(
                  width: mWidth * .29,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: mHeight * .01),
            height: mHeight * .07,
            width: mWidth,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: mWidth * .075),
                  height: mHeight * .05,
                  width: mWidth * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(3),
                        height: mHeight * .04,
                        width: mWidth * .13,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                              AssetImage("asset/PaymentLogo/phonePe logo")),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: mWidth * .03,
                ),
                Text("PhonePe"),
                SizedBox(
                  width: mWidth * .29,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: mHeight * .01),
            height: mHeight * .07,
            width: mWidth,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: mWidth * .075),
                  height: mHeight * .05,
                  width: mWidth * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage("asset/PaymentLogo/UPI logo")),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: mWidth * .03,
                ),
                Container(
                  height: mHeight * .04,
                  width: mWidth * .6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Pay Via UPI"),
                      Text(
                        "You need to have a registered UPI ID",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: mHeight * .01,
          ),
          Divider(
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),
          SizedBox(
            height: mHeight * .01,
          ),
          Row(
            children: [
              SizedBox(
                width: mWidth * .075,
              ),
              Text(
                "Wallets",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: mHeight * .02),
            height: mHeight * .07,
            width: mWidth,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: mWidth * .075),
                  height: mHeight * .05,
                  width: mWidth * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage("asset/PaymentLogo/Paytm-Logo")),
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: mWidth * .03,
                ),
                Container(
                  margin: EdgeInsets.only(top: mHeight * .01),
                  height: mHeight * .06,
                  width: mWidth * .6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Paytm"),
                      Text(
                        "Link your Paytm wallet to use this payment method.",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: mHeight * .01),
            height: mHeight * .07,
            width: mWidth,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: mWidth * .075),
                  height: mHeight * .05,
                  width: mWidth * .15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(3),
                        height: mHeight * .04,
                        width: mWidth * .13,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "asset/PaymentLogo/MobiKwik Logo")),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: mWidth * .03,
                ),
                Container(
                  margin: EdgeInsets.only(top: mHeight * .01),
                  height: mHeight * .06,
                  width: mWidth * .6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mobikwik"),
                      Text(
                        "Link your Mobikwik wallet to use this payment method.",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.grey,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
