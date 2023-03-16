import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quota_01/Screen/Controller/Home_Controller.dart';
import 'package:quota_01/Screen/modal/Home_Modal.dart';
import 'package:quota_01/Untile/Database_Helper.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Home_Controller home_controller = Get.put(Home_Controller());
  Database_Helper database_helper = Get.put(Database_Helper());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal,
                      Colors.indigo,
                      Colors.brown,
                    ],
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Amazing Quotes",
                    style:
                        GoogleFonts.satisfy(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider.builder(
                    itemCount: home_controller.Images.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                  blurStyle: BlurStyle.solid,
                                  offset: Offset(7, 7),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.teal,
                              )),
                          child: Image.network(
                            "${home_controller.Images[index]}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 2,
                      onPageChanged: (index, reason) {
                        home_controller.Index.value = index;
                      },
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: home_controller.Images.asMap()
                          .entries
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.all(10),
                              height: home_controller.Index.value == e.key
                                  ? 16
                                  : 11,
                              width: home_controller.Index.value == e.key
                                  ? 16
                                  : 11,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: home_controller.Index.value == e.key
                                      ? Colors.indigo
                                      : Colors.white,
                                  shape: home_controller.Index.value == e.key
                                      ? BoxShape.rectangle
                                      : BoxShape.circle),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Most Popular")),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: home_controller.quotelist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent:
                              MediaQuery.of(context).size.width / 2 - 30,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            home_controller.int.value = index;
                            home_controller.change.value = 0;
                            Get.toNamed('show');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(3),
                            color: home_controller.quotelist[index].colors,
                            height: 70,
                            child: Text(
                              "${home_controller.quotelist[index].author_name}",
                              style: GoogleFonts.satisfy(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 370,
                  color: Colors.black26,
                  child: FutureBuilder(
                    future: database_helper.readdb(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        List<Map>? l1 = snapshot.data;
                        return ListView.builder(
                          itemCount: l1!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [Text("${l1[index]['name']}")],
                            );
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 370,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('add');
          },
          child: Text(
            "+",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
