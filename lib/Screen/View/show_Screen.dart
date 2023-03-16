import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quota_01/Screen/Controller/Home_Controller.dart';
import 'package:share_plus/share_plus.dart';

class Show_Screen extends StatefulWidget {
  const Show_Screen({Key? key}) : super(key: key);

  @override
  State<Show_Screen> createState() => _Show_ScreenState();
}

class _Show_ScreenState extends State<Show_Screen> {
  Home_Controller home_controller = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 30,
              child: Obx(
                () => Image.network(
                  "${home_controller.quotelist[home_controller.int.value].image![home_controller.change.value]}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${home_controller.quotelist[home_controller.int.value].quote}",
                      style: home_controller.Text.value == 0
                          ? GoogleFonts.lobster(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)
                          : GoogleFonts.satisfy(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "${home_controller.quotelist[home_controller.int.value].author_name}",
                        style: home_controller.Text.value == 0
                            ? GoogleFonts.lobster(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)
                            : GoogleFonts.satisfy(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (home_controller.change.value == 5) {
                          home_controller.change.value = 0;
                        } else {
                          home_controller.change.value++;
                        }
                      },
                      icon: Icon(
                        Icons.photo,
                        color: Colors.white,
                      ),
                    ),
                    Obx(
                      () => IconButton(
                          onPressed: () {
                            if (home_controller.Text.value == 0) {
                              home_controller.Text.value = 1;
                            } else {
                              home_controller.Text.value = 0;
                            }
                          },
                          icon: home_controller.Text.value == 0
                              ? Icon(
                                  Icons.format_color_text_outlined,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.text_format_rounded,
                                  color: Colors.white,
                                )),
                    ),
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          if (home_controller.copy.value == 0) {
                            home_controller.copy.value = 1;
                            Clipboard.setData(ClipboardData(
                                text:
                                    "${home_controller.quotelist[home_controller.int.value].quote}"));
                          } else {
                            home_controller.copy.value = 0;
                          }
                        },
                        icon: home_controller.copy.value == 0
                            ? Icon(
                                Icons.copy,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.check_box,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Share.share(
                            "${home_controller.quotelist[home_controller.int.value].quote}");
                      },
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          if (home_controller.Star.value == 0) {
                            home_controller.Star.value = 1;
                          } else {
                            home_controller.Star.value = 0;
                          }
                        },
                        icon: home_controller.Star.value == 0
                            ? Icon(
                                Icons.star_border,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
