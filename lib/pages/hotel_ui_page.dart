import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HotelUiPage extends StatefulWidget {
  const HotelUiPage({Key? key}) : super(key: key);
  static const String id = 'hotel_ui_page';

  @override
  _HotelUiPageState createState() => _HotelUiPageState();
}

class _HotelUiPageState extends State<HotelUiPage> {
  bool isLoading = true;
  List items = [
    "assets/images/ic_header.jpg",
    "assets/images/ic_hotel0.jpg",
    "assets/images/ic_hotel1.jpg",
    "assets/images/ic_hotel2.jpg",
    "assets/images/ic_hotel3.jpg",
  ];

  Future<void> check() async {
    Timer(Duration(seconds: 4), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                isLoading?Shimmer.fromColors(
                  highlightColor: Colors.grey[600]!,
                  baseColor: Colors.grey[300]!,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.33,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),
                ):Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: items
                          .map(
                            (item) => Container(
                              child: Center(
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Column(
                      children: [
                        Container(
                          child: const Text(
                            "What kind of hotel you need?",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 30),
                          child: TextField(
                            // style: TextStyle(color: gre),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 4),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: "Search for hotels...",
                              contentPadding: const EdgeInsets.only(top: 15),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                isLoading
                    ? Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Shimmer.fromColors(
                          highlightColor: Colors.grey[600]!,
                          baseColor: Colors.grey[300]!,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return buildListView();
                            },
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return buildListView();
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildListView() {
    return Column(
      children: [
        isLoading
            ? Shimmer.fromColors(
                highlightColor: Colors.grey.shade600,
                baseColor: Colors.grey.shade300,
                child: Container(
                  color: Colors.grey,
                  height: 25,
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 22),
                  alignment: Alignment.centerLeft,
                ),
              )
            : Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 22),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Best Hotel',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
        Container(
          height: MediaQuery.of(context).size.height * 0.21,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/ic_hotel$index.jpg"),
                        fit: BoxFit.cover,
                      )),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Hotel 1",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
