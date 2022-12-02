import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/repository/api/authentication/login.dart';
import 'package:fursan_cart/repository/api/authentication/signup.dart';
import 'package:fursan_cart/repository/bloc/user/signin/signin_bloc.dart';
import 'package:fursan_cart/ui/widgets/splash/splash.dart';

import 'repository/api/authentication/firbase/facebook.dart';
import 'repository/api/authentication/firbase/googel.dart';
import 'repository/bloc/user/signup/signup_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize

//...
  Facebook facebook = Facebook();
  Google google = Google();
  ApiLogin apiLogin=ApiLogin();
  ApiSignUp apiSignUp=ApiSignUp();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>SigninBloc(apiLogin,google,facebook)),
        BlocProvider(create: (BuildContext context)=>SignupBloc(apiSignUp)),

      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
