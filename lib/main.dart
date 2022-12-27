import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/repository/api/authentication/login.dart';
import 'package:fursan_cart/repository/api/authentication/signup.dart';
import 'package:fursan_cart/repository/api/brand/brandIdApi.dart';
import 'package:fursan_cart/repository/api/category/CatogeryApi.dart';
import 'package:fursan_cart/repository/api/favorites/favoritesApi.dart';
import 'package:fursan_cart/repository/api/search%20api/SearchApi.dart';
import 'package:fursan_cart/repository/bloc/banner/banner_bloc.dart';
import 'package:fursan_cart/repository/bloc/brandMain/brandid/brandid_bloc.dart';
import 'package:fursan_cart/repository/bloc/category/catogery_bloc.dart';
import 'package:fursan_cart/repository/bloc/trending/tranding_bloc.dart';
import 'package:fursan_cart/repository/bloc/user/signin/signin_bloc.dart';
import 'package:fursan_cart/ui/Mainhome/BottomNavigation/MainHome.dart';
import 'package:fursan_cart/ui/widgets/splash/splash.dart';

import 'repository/api/ProductDetails/TrendingApi.dart';
import 'repository/api/ProductDetails/bestoffersProductApi.dart';
import 'repository/api/authentication/firbase/facebook.dart';
import 'repository/api/authentication/firbase/googel.dart';
import 'repository/api/banner/bannerApi.dart';
import 'repository/api/brand/brandApi.dart';
import 'repository/bloc/ProductDetails/product_details_bloc.dart';
import 'repository/bloc/brandMain/brand/brand_bloc.dart';
import 'repository/bloc/favorites/favorites_bloc.dart';
import 'repository/bloc/search/search_bloc.dart';
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
  ApiBanner apiBanner=ApiBanner();
  ApiBrand apiBrandr=ApiBrand();
  // ApiBrandId apiBrandId=ApiBrandId();
  SearchApi searchApi=SearchApi();
  CatogeryApi catogeryApi= CatogeryApi();
  BestoffersProductApi bestoffersProductApi=BestoffersProductApi();
  ProductDetailsApi productDetailsApi=ProductDetailsApi();
  ApiFavorites apiFavorites=ApiFavorites();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>SigninBloc(apiLogin,google,facebook)),
        BlocProvider(create: (BuildContext context)=>SignupBloc(apiSignUp)),
        BlocProvider(create: (context) => BannerBloc()),
        BlocProvider(create: (context) => BrandBloc(apiBrandr)),
        BlocProvider(create: (context) => TrandingBloc(productDetailsApi)),
        BlocProvider(create: (context) => ProductDetailsBloc(bestoffersProductApi)),
        // BlocProvider(create: (context) => BrandidBloc(apiBrandId)),
        BlocProvider(create: (context) => SearchBloc(searchApi)),
        BlocProvider(create: (context) => CatogeryBloc(catogeryApi)),
        BlocProvider(create: (context) => FavoritesBloc(apiFavorites)),


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
      debugShowCheckedModeBanner: false,
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
      home: Splash(),
    );
  }
}
