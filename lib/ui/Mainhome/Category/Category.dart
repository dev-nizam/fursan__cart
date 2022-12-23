import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/category/CatogeryModel.dart';
import 'package:fursan_cart/repository/bloc/category/catogery_bloc.dart';
import 'package:fursan_cart/ui/Mainhome/Category/subcategoryproducts.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CatogeryBloc>(context).add(FetchCatogery());

    super.initState();
  }

  late List<CatogeryModel> catogeryModel;

  String Visible = "";
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<CatogeryBloc, CatogeryState>(builder: (context, state) {
      if (state is CatogeryLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is CatogeryError) {
        return RefreshIndicator(
          onRefresh: () async {
            return BlocProvider.of<CatogeryBloc>(context).add(FetchCatogery());
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              // color: Colors.red,
              child: const Center(
                child: Text("something went wrong"),
              ),
            ),
          ),
        );
      }
      if (state is CatogeryLoaded) {
        catogeryModel = BlocProvider.of<CatogeryBloc>(context).catogeryModel;
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "Categories",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (Visible.isNotEmpty) {
                            setState(() {
                              Visible = "";
                            });
                          } else {
                            setState(() {
                              Visible = index.toString();
                            });
                          }
                        },
                        child: Card(
                          elevation: 4,
                          child: SizedBox(
                            height: mHeight * .12,
                            width: mWidth * .85,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: mWidth * .02),
                                  height: mHeight * .08,
                                  width: mWidth * .2,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffDAF6FF),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                        "http://fursancart.rootsys.in/api" +
                                            "/category/images/" +
                                            catogeryModel[index]
                                                .image!
                                                .url
                                                .toString(),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: mWidth * .07),
                                  height: mHeight * .08,
                                  width: mWidth * .45,
                                  // color: Colors.yellow,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        catogeryModel[index].name.toString(),
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: Visible == index.toString(),
                        child: Card(
                          elevation: 4,
                          child: SizedBox(
                            height: mHeight * .2,
                            width: mWidth * .8,
                            child: GridView.builder(
                              itemCount:
                              catogeryModel[index].subCategories!.length,
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 15),
                              itemBuilder: (BuildContext context, int indexx) {
                                return Column(
                                  //mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                  SubCategoryProducts(name:   catogeryModel[index]
                                                      .subCategories![indexx]
                                                      .name.toString(),
                                                  Subid:   catogeryModel[index]
                                                      .subCategories![indexx]
                                                      .id.toString(),
                                                  )));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xffDAF6FF),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: NetworkImage(
                                                "http://fursancart.rootsys.in/api" +
                                                    "/sub-category/images/" +
                                                    catogeryModel[index]
                                                        .subCategories![indexx]
                                                        .image!
                                                        .url
                                                        .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      catogeryModel[index]
                                          .subCategories![indexx]
                                          .name
                                          .toString(),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (ctx, index) {
                  return SizedBox(
                    height: mHeight * .03,
                  );
                },
                itemCount: catogeryModel.length));
      }
      return const Center(
        child: Text("no response"),
      );
    });
  }
}
