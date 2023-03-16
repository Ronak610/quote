import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  TextEditingController txtcategory = TextEditingController();
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
                  child: Text(
                    "Create Quote",
                    style:
                        GoogleFonts.satisfy(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    TextField(
                      controller: txtcategory,
                      decoration: InputDecoration(
                        label: Text("Category"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      style: TextStyle(height: 3),
                      controller: txtquote,
                      decoration: InputDecoration(
                        label: Text("Quote "),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: txtauthor_name,
                      decoration: InputDecoration(
                        label: Text("Author Name"),
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
                  Database_Helper db_helper = Database_Helper();
                  db_helper.insertdb(
                    txtcategory.text,
                    txtquote.text,
                    txtauthor_name.text,
                  );
                  Get.toNamed('/');
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
