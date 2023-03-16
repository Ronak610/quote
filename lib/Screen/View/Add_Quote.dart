import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quota_01/Untile/Database_Helper.dart';

class Add_Quote extends StatefulWidget {
  const Add_Quote({Key? key}) : super(key: key);

  @override
  State<Add_Quote> createState() => _Add_QuoteState();
}

class _Add_QuoteState extends State<Add_Quote> {
  TextEditingController txtimage = TextEditingController();
  TextEditingController txtquote = TextEditingController();
  TextEditingController txtauthor_name = TextEditingController();

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
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed('/');
                        },
                        icon: Icon(Icons.arrow_back_outlined,color: Colors.white,),
                      ),
                      Text(
                        "Create Quote",
                        style: GoogleFonts.satisfy(
                            fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    TextField(
                      maxLines: 3,
                      controller: txtquote,
                      decoration: InputDecoration(
                        label: Text("Quote"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: txtauthor_name,
                      decoration: InputDecoration(
                        label: Text("Author_Name "),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: txtimage,
                      decoration: InputDecoration(
                        label: Text("Image Link"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Fluttertoast.showToast(msg:"Quotes Done",toastLength: Toast.LENGTH_SHORT);
                  Database_Helper db_helper = Database_Helper();
                  db_helper.insertdb(
                    txtimage.text,
                    txtquote.text,
                    txtauthor_name.text,
                  );
                  Get.back();
                },
                child: Text("Submit",),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
