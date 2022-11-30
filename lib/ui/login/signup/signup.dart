
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fursan_cart/ui/login/signin/signin.dart';

import '../../../repository/bloc/user/signup/signup_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController PasswordController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController UsernameController = TextEditingController();
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;

    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          print("loading");
        }
        if (state is SignupLoaded) {
          print("loaded");
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => Signin()));
        }
        if (state is SignupError) {
          print("Error");
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: mHeight,
              width: mWidth,
              decoration: BoxDecoration(
                  color: Color(0xff1c2c43),
                  image: DecorationImage(
                      image: AssetImage("asset/Login/Signup.jpg"),
                      fit: BoxFit.fill)),
            ),
            Positioned(
              top: 220,
              left: 40,
              child: Container(
                height: mHeight * .8,
                child: Column(children: [
                  SizedBox(
                    height: mHeight * .15,
                  ),
                  Container(
                    height: mHeight * .07,
                    width: mWidth * .8,
                    child: TextField(
                      controller: UsernameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.2),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.person),
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
                      controller: EmailController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.2),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 2.0),
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
                      controller: PasswordController,
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
                        BlocProvider.of<SignupBloc>(context).add(FetchSignUp(
                            userName: UsernameController.text, email: EmailController.text, password: PasswordController.text
                           ));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xff264050),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            // Change your radius here
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mHeight * .09,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: mWidth * .02,
                      ),
                      Text(
                        "Already have an Account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => Signin()));
                        },
                        child: Text(
                          "  Log in",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
