
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/profile/ProfileModel.dart';
import 'package:fursan_cart/repository/bloc/profile/profile_bloc.dart';
import 'package:fursan_cart/ui/Mainhome/Order/Order.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenCart.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenDeliveryAddress.dart';
import 'package:fursan_cart/ui/login/signin/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/AppBar/Screenfavourites.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late ProfileModel profileModel;
  bool visible=false;

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ProfileBloc>(context).add(FatchProfile(id: 'id'));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<ProfileBloc, ProfileState>(
  builder: (context, state) {
      if (state is ProfileLoading) {
        print("State.........");
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is ProfileError) {
        return
          // RefreshIndicator(
          // onRefresh: () async {
          //   return BlocProvider.of<ProfileBloc>(context)
          //       .add(FatchProfile(id: id));
          // },
          // child:
    SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .9,
              // color: Colors.red,
              child: const Center(
                child: Text("something went wrong"),
              ),
            ),
          );
        // );
      }
      if (state is ProfileLoaded) {
        print("state loaded.......");

        profileModel=
            BlocProvider.of<ProfileBloc>(context).profileModel;

        return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "My Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Center(
                child: Text(
                  profileModel.user!.name.toString(),
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => const Order()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: mWidth * .075, top: mHeight * .02),
                      height: mHeight * .07,
                      width: mWidth * .4,
                      color: const Color(0xffFFC113),
                      child: const Center(
                          child: Text(
                        "Orders",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const ScreenFavourites()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: mWidth * .05, top: mHeight * .02),
                      height: mHeight * .07,
                      width: mWidth * .4,
                      color: const Color(0xffFFC113),
                      child: const Center(
                          child: Text(
                        "Favourites",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const ScreenCart()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: mWidth * .075, top: mHeight * .02),
                      height: mHeight * .07,
                      width: mWidth * .4,
                      color: const Color(0xffFFC113),
                      child: const Center(
                          child: Text(
                        "Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const ScreenDeliveryAddress()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: mWidth * .05, top: mHeight * .02),
                      height: mHeight * .07,
                      width: mWidth * .4,
                      color: const Color(0xffFFC113),
                      child: const Center(
                          child: Text(
                        "Saved Address",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mHeight * .02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .075,
                  ),
                  const Text(
                    "Mobile Number",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Container(
                width: mWidth * .85,
                height: mHeight * .04,
                child:  TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: profileModel.phone.toString(),
                  ),
                ),
              ),
              SizedBox(
                height: mHeight * .03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .075,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Container(
                width: mWidth * .85,
                height: mHeight * .04,
                child:
                TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: profileModel.email.toString(),
                  ),
                ),
              ),
              SizedBox(
                height: mHeight * .02,
              ),
              TextButton(onPressed:() {
                setState(() {
                  visible=!visible;
                });
              },child: Text("EDIT",
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),),

              ),visible?
             Column(
               children: [
                 SizedBox(
                   height: mHeight * .05,
                 ),
                 Row(
                   children: [
                     SizedBox(
                       width: mWidth * .075,
                     ),
                     Text(
                       "UserName",
                       style: TextStyle(color: Colors.grey),
                     ),
                   ],
                 ),
                 Container(
                   width: mWidth * .85,
                   height: mHeight * .04,
                   child: const TextField(
                     decoration: InputDecoration(
                         suffixIcon: Padding(
                           padding: EdgeInsets.only(top: 8),
                           child: Text(
                             "Update",
                             style: TextStyle(
                               color: Colors.orange,
                             ),
                           ),
                         )),
                   ),
                 ),
                 SizedBox(
                   height: mHeight * .05,
                 ),
                 Row(
                   children: [
                     SizedBox(
                       width: mWidth * .075,
                     ),
                      Text(
                       "Mobile Number",
                       style: TextStyle(color: Colors.grey),
                     ),
                   ],
                 ),
                 Container(
                   width: mWidth * .85,
                   height: mHeight * .04,
                   child: const TextField(
                     decoration: InputDecoration(
                         suffixIcon: Padding(
                       padding: EdgeInsets.only(top: 8),
                       child: Text(
                         "Update",
                         style: TextStyle(
                           color: Colors.orange,
                         ),
                       ),
                     )),
                   ),
                 ),
                 SizedBox(
                   height: mHeight * .03,
                 ),
                 Row(
                   children: [
                     SizedBox(
                       width: mWidth * .075,
                     ),
                     const Text(
                       "Email",
                       style: TextStyle(color: Colors.grey),
                     ),
                   ],
                 ),
                 Container(
                   width: mWidth * .85,
                   height: mHeight * .04,
                   child: const TextField(
                     decoration: InputDecoration(
                         suffixIcon: Padding(
                       padding: EdgeInsets.only(top: 8),
                       child: Text(
                         "Update",
                         style: TextStyle(
                           color: Colors.orange,
                         ),
                       ),
                     )),
                   ),
                 ),
                 SizedBox(
                   height: mHeight * .03,
                 ),
               ],
             ):Container(),
              Row(
                children: [
                  SizedBox(
                    width: mWidth * .075,
                  ),
                  const Text(
                    "Change Password",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: mHeight * .05,
              ),
              SizedBox(
                height: mHeight * .06,
                width: mWidth * .5,
                child: ElevatedButton(
                    onPressed: () async{
                      SharedPreferences preference =
                          await SharedPreferences.getInstance();
                      preference.clear();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (ctx) => Signin()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color(0xff264050), //background color of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "Log Out",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
      }
      return Center(
        child: Text("no response"),
      );
  },
);
  }
  Future<void>id() async {

  final preferances = await SharedPreferences.getInstance();
  preferances.getString("id");
  // preferances.setString("userid", userid);
}
}
