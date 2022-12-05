
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/brand/BrandModel.dart';
import 'package:fursan_cart/repository/bloc/brand/brand_bloc.dart';
import 'package:fursan_cart/ui/home/Brand/ScreenBrand.dart';



class BrandHome extends StatefulWidget {
  const BrandHome({Key? key}) : super(key: key);

  @override
  State<BrandHome> createState() => _BrandHomeState();
}

class _BrandHomeState extends State<BrandHome> {
  late List<BrandModel> brandModel;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<BrandBloc>(context).add(FatchBrand());

    super.initState();
  }
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<BrandBloc, BrandState>(
        builder: (context, state) {
          if (state is BrandLoading) {
            print(" brand ui State.. loading.......");
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BrandError) {
            print(" brand ui loaded..error...");
            return RefreshIndicator(
              onRefresh: () async {
                return BlocProvider.of<BrandBloc>(context)
                    .add(FatchBrand());
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .9,
                  // color: Colors.red,
                  child: Center(
                    child: Text("something went wrong"),
                  ),
                ),
              ),
            );
          }


          if (state is BrandLoaded) {
            print(" brand ui state loaded.......");
            // notificationModelClass = BlocProvider.of<NotificationBloc>(context)
            //     .notificationModelClass;
            brandModel=
                BlocProvider.of<BrandBloc>(context).brandModel;
            return Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: mWidth * .04,
                      ),
                      const Text(
                        "Choose Brand",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mHeight * .015,
                  ),
                  Container(
                      height: mHeight * .09,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: GestureDetector(
                                onTap: () {
                                  print(" $brandModel[index].image!.url.toString()");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => const ScreenBrand()));
                                },
                                child: Container(
                                  height: mHeight * .06,
                                  width: mWidth * .195,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "http://192.168.1.9:3010/api" +
                                                  "/brand/images/" +
                                                  brandModel[index].image!.url.toString()),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return const SizedBox(
                              width: 1,
                            );
                          },
                          itemCount: brandModel.length)),
                ],
              ),
            );
          }

          return Center(
            child: Text("no response"),
          );
        }
    );
  }
}

final List BrandImages = [
  "asset/brand icons/image 3.png",
  "asset/brand icons/image 4.png",
  "asset/brand icons/image 5.png",
  "asset/brand icons/image 6.png",
];
