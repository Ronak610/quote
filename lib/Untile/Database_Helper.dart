import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Database_Helper {
  Database? db;
  List l1 = [];

  Future<Database?> Checkdb() async {
    if (db != null) {
      return db;
    } else {
      return await Createdb();
    }
  }

  Future<Database> Createdb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'ronak.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE std(id INTEGER PRIMARY KEY AUTOINCREMENT,image TEXT,author TEXT,quote TEXT)";
        db.execute(query);
      },
    );
  }

  Future<void> insertdb(String c1, String q1, String a1) async {
    db = await Checkdb();
    db!.insert("std", {"image": c1, "quote": q1, "author": a1});
  }

  Future<List<Map>> readdb() async {
    db = await Checkdb();
    String Query = "SELECT * FROM std";
    List<Map> l1 = await db!.rawQuery(Query, null);
    return l1;
  }

  Future<void> deletdb(int id)
  async {
   db= await Checkdb();
   db!.delete("std",where: "id = ? ",whereArgs: [id]);
  }

  Future<void> Updatedb(String q1,String a1,int id)
  async {
    db = await Checkdb();
    db!.update("std",{"quote":q1,"author":a1},whereArgs: [id],where: "id = ?");
  }
}
