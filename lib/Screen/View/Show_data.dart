import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quota_01/Screen/Controller/Home_Controller.dart';
import 'package:quota_01/Untile/Database_Helper.dart';
import 'package:share_plus/share_plus.dart';

class Data_Show extends StatefulWidget {
  const Data_Show({Key? key}) : super(key: key);

  @override
  State<Data_Show> createState() => _Data_ShowState();
}

class _Data_ShowState extends State<Data_Show> {
  TextEditingController txtquote = TextEditingController();
  TextEditingController txtauthor_name = TextEditingController();
  Home_Controller home_controller = Get.put(Home_Controller());
  Database_Helper database_helper = Get.put(Database_Helper());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 30,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.black54,
              child: Image.network(
                "${home_controller.data['image']}",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 30,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.black54,
            ),
            GetBuilder<Home_Controller>(builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${controller.data['quote']}",
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${controller.data['author']}",
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
                ),
              ],
            ),),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                      () =>
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              txtquote = TextEditingController(text: home_controller.data['quote']);
                              txtauthor_name = TextEditingController(text: home_controller.data['author']);
                              print("=======Uopdate");
                              Get.defaultDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(controller: txtquote,),
                                    SizedBox(height: 10,),
                                    TextField(controller: txtauthor_name,),
                                    SizedBox(height: 10,),
                                    ElevatedButton(onPressed: (){
                                      database_helper.Updatedb(
                                          txtquote.text, txtauthor_name.text,home_controller.data['id']);
                                      home_controller.GetData2();
                                      home_controller.GetData();
                                      Get.back();
                                    }, child: Text("Update Quote"))
                                  ],
                                )
                              );


                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
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
                          IconButton(
                            onPressed: () {
                              if (home_controller.copy.value == 0) {
                                home_controller.copy.value = 1;
                                Clipboard.setData(ClipboardData(
                                    text: "${home_controller.data['quote']}"));
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
                          IconButton(
                            onPressed: () {
                              Share.share(
                                  "${home_controller.quotelist[home_controller
                                      .int.value].quote}");
                            },
                            icon: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                database_helper.deletdb(
                                    home_controller.data['id']);
                                home_controller.GetData();
                                Get.back();
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.white,
                              )),
                        ],
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
