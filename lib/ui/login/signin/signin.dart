import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fursan_cart/repository/bloc/user/signin/signin_bloc.dart';
import 'package:fursan_cart/ui/Mainhome/BottomNavigation/MainHome.dart';
import 'package:fursan_cart/ui/login/signup/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool hide = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passenable = false;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        if (state is SigninLoading) {
          print("loading");
        }
        if (state is SigninLoaded) {
          savetoken(state.Token);
          print("loaded");
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => MainHome()));

          String token = state.Token;

        }
        if (state is SigninError) {
          print("Error");
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(children: [
            Container(
              height: mHeight,
              width: mWidth,
              decoration: BoxDecoration(
                  color: Color(0xff1c2c43),
                  image: DecorationImage(
                      image: AssetImage("asset/Login/Login.jpg"),
                      fit: BoxFit.fill)),
            ),
            Column(
              children: [
                SizedBox(
                  height: mHeight * .4,
                ),
                Container(
                  height: mHeight * .07,
                  width: mWidth * .8,
                  child: TextField(
                    controller: emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(.2),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                SizedBox(
                  height: mHeight * .025,
                ),
                Container(
                  height: mHeight * .07,
                  width: mWidth * .8,
                  child: TextField(
                    obscureText: passenable,
                    controller: passwordController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.2),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon:
                        Image.asset("asset/icons/passwordcheck.png"),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (passenable) {
                                  passenable = false;
                                } else {
                                  passenable = true;
                                }
                              });
                            },
                            icon: Icon(passenable == true
                                ? FontAwesomeIcons.eyeSlash
                                : Icons.remove_red_eye))),
                  ),
                ),
                SizedBox(
                  height: mHeight * .05,
                ),
                SizedBox(
                  height: mHeight * .07,
                  width: mWidth * .8,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<SigninBloc>(context).add(FetchLogin(Email: emailController.text, password: passwordController.text));

                              // emailController.text, passwordController.text
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffFFC113)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: mHeight * .015,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: mWidth * .61,
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: mHeight * .08,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: mWidth * .4,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SigninBloc>(context)
                            .add(GoogleLogin());
                        // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MainHome()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        backgroundImage: AssetImage(
                            "asset/icons/.png"),
                      ),
                    ),
                    SizedBox(
                      width: mWidth * .01,
                    ),
                    Container(
                      height: mHeight * .035,
                      width: mWidth * .01,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: mWidth * .01,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SigninBloc>(context)
                            .add(FacebookLogin());
                        // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MainHome()));
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: mHeight * .05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: mWidth * .26,
                    ),
                    Text(
                      "Don't have Account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Signup()));
                      },
                      child: Text(
                        "  Sign up",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ])),
    );
  }

    Future<void> savetoken(String token) async {
    print(token);
      final preferances = await SharedPreferences.getInstance();
      preferances.setString("token", token);
    }
}



