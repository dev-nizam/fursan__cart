import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fursan_cart/model/ProductDetails/ProductDetailsModel.dart';
import 'package:fursan_cart/model/search/SearchModel.dart';
import 'package:fursan_cart/repository/bloc/search/search_bloc.dart';
import 'package:fursan_cart/ui/Mainhome/home.dart';
import 'package:fursan_cart/ui/home/ProductDetails/ScreenProductdetails.dart';



class SearchPageHome extends StatefulWidget {
  const SearchPageHome({Key? key}) : super(key: key);

  @override
  State<SearchPageHome> createState() => _SearchPageHomeState();
}

class _SearchPageHomeState extends State<SearchPageHome> {
  TextEditingController ProductController = TextEditingController();

  void initState() {
    BlocProvider.of<SearchBloc>(context).add(FetchSearch("Iphone"));
    super.initState();
  }
  late List<ProductDetailsModel> productDetailsModel;
  late List<SearchModel> searchModel;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: mHeight * .05,
          ),
          Center(
            child: Container(
              height: mHeight * .07,
              width: mWidth * .92,
              child: TextField(
                onChanged: (value) {
                  BlocProvider.of<SearchBloc>(context).add(FetchSearch(value));
                },
                controller: ProductController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.2),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Search by keyword or Brand",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SearchError) {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
              if (state is SearchLoaded) {
                searchModel = BlocProvider.of<SearchBloc>(context).searchModel;
                return Expanded(
                  child: ListView.builder(
                      itemCount: searchModel.length,
                      itemBuilder: (ctx, index) {
                        return SizedBox(
                          height: mHeight * .09,
                          // width: 200,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => ScreenProductDetails(productDetailsModel:productDetailsModel![index])));
                            },
                            child: Card(
                                child: ListTile(
                              leading: CircleAvatar(
                                  child: Image.network(
                                      mainApi +
                                          "/product/images/" +
                                          searchModel[index].url!.toString())),
                              title: Text(searchModel[index].name.toString()),
                            )),
                          ),
                        );
                      }),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
