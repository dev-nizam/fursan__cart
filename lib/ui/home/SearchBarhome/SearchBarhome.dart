import 'package:flutter/material.dart';

class SearchBarHome extends StatefulWidget {
  const SearchBarHome({Key? key}) : super(key: key);

  @override
  State<SearchBarHome> createState() => _SearchBarHomeState();
}

class _SearchBarHomeState extends State<SearchBarHome> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: mHeight * .01,
          ),
          Center(
            child: Container(
              height: mHeight * .07,
              width: mWidth * .92,
              child: TextField(
                enabled: false,
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
        ],
      ),
    );
  }
}
