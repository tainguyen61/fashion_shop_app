import 'dart:convert';

import 'package:fashion_shop_app/models/favorite_model.dart';
import 'package:fashion_shop_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late Database database;
const DB_Name = 'student_database.db';
const TABLE_NAME = 'favorite_product_list';

class SQLiteController {
  Future<void> initializaDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    database = await openDatabase(
      join(await getDatabasesPath(), DB_Name),
    );
    database.execute(
      'CREATE TABLE IF NOT EXISTS $TABLE_NAME (id TEXT PRIMARY KEY , img TEXT, name TEXT, describle TEXT, price INT)',
    );
  }

  Future<void> insertProduct(ProductModel product) async {
    final db = database;

    await db.rawInsert(
        'INSERT INTO $TABLE_NAME (ID, IMG, NAME, DESCRIBLE, PRICE) VALUES(\'${product.id}\',\'${product.img[0]}\',\'${product.name}\',\'${product.describle}\',\'${product.price}\')');
  }

  Future<List<FavoriteProduct>> favoriteProduct() async {
    final db = database;
    final List<Map<String, dynamic>> maps =
    await db.rawQuery('SELECT * FROM $TABLE_NAME');
    return List.generate(
      maps.length,
          (i) {
        return FavoriteProduct(
          id: maps[i]['id'],
          img: maps[i]['img'],
          name: maps[i]['name'],
          describle: maps[i]['describle'],
          price: maps[i]['price'],
        );
      },
    );
  }

  // Future<void> updateStudent(Student student) async {
  //   final db = database;
  //
  //   await db.update(
  //     'students',
  //     student.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [student.id],
  //   );
  // }

  Future<void> deleteStudent(String id) async {
    final db = database;

    await db.delete(
      TABLE_NAME,

      where: 'id = ?',

      whereArgs: [id],
    );
  }
}
