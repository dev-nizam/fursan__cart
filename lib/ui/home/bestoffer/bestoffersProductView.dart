//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
// import 'package:fursan_cart/model/banner/BannerModel.dart';
// import 'package:fursan_cart/repository/bloc/ProductDetails/product_details_bloc.dart';
// import 'package:fursan_cart/ui/Mainhome/home.dart';
// import 'package:fursan_cart/ui/home/ProductDetails/ScreenProductdetails.dart';
//
// class BestOffersProductView extends StatefulWidget {
//   BestOffersProductView({Key? key,   }) : super(key: key);
//
//   @override
//   State<BestOffersProductView> createState() => _BestOffersProductViewState();
// }
//
// class _BestOffersProductViewState extends State<BestOffersProductView> {
//   void initState() {
//     BlocProvider.of<ProductDetailsBloc>(context).add(FatchBestoffersProduct());
//     super.initState();
//   }
//
//   late List<ProductDetailsModel> productDetailsModel;
//   @override
//   Widget build(BuildContext context) {
//     final mHeight = MediaQuery.of(context).size.height;
//     final mWidth = MediaQuery.of(context).size.width;
//     return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
//   builder: (context, state) {
//       if (state is ProductDetailsLoading) {
//         print("ProductDetailsLoading");
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       if (state is ProductDetailsError) {
//
//         print("ProductDetailsError");
//         return const Center(
//           child: Text("Something went wrong"),
//         );
//       }
//       if (state is ProductDetailsLoaded) {
//         print("ProductDetailsLoaded");
//         productDetailsModel = BlocProvider.of<ProductDetailsBloc>(context).productDetailsModel;
//     return ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (ctx, index) {
//           return GestureDetector(
//             onTap: () {
//
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (ctx) => ScreenProductDetails(productDetailsModel: productDetailsModel[index])));
//             },
//             child: Container(
//               height: mHeight * .205,
//               width: mWidth,
//               color: Colors.white,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: mWidth * .05,
//                   ),
//                   Container(
//                     height: mHeight * .17,
//                     width: mWidth * .35,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: NetworkImage(mainApi +
//                                 "/product/images/"+ productDetailsModel[index].images![0].url.toString()
//
//                             )
//                         )),
//                   ),
//                   Container(
//                     height: mHeight * .1,
//                     width: mWidth * .5,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: mHeight * .02,
//                         ),
//                         Text(
//                             productDetailsModel[index].name.toString(),maxLines: 1,
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         RatingBar.builder(
//                           itemSize: 20,
//                           initialRating: 3,
//                           minRating: 1,
//                           direction: Axis.horizontal,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                           onRatingUpdate: (rating) {
//                             print(rating);
//                           },
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.currency_rupee_rounded,
//                               color: Colors.grey,
//                               size: 14,
//                             ),
//                             Text(
//                               productDetailsModel[index].price.toString(),maxLines: 2,
//                               style:
//                               TextStyle(color: Colors.grey, fontSize: 14),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Icon(Icons.favorite, color: Colors.orange, size: 19),
//                 ],
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (ctx, index) {
//           return Divider(
//             thickness: 1,
//           );
//         },
//         itemCount: productDetailsModel.length);
//   }
//
//         return Container();
//   },
// );
//   }
//
// }
