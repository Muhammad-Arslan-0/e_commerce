import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/product_model.dart';

class DatabaseHelper {
  static final _databaseName = "cart.db";
  static final _databaseVersion = 1;
  static final table = "cart";
  static final productID = 'productID';
  static final productTitle = 'productTitle';
  static final productPrice = 'productPrice';
  static final productIMG = 'productIMG';
  static final isFavoriteProduct = 'isFavoriteProduct';
  static final quantity = 'quantity';
  static final productSize = 'productSize';
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $table (
    $productID INTEGER PRIMARY KEY,
    $productTitle FLOAT NOT NULL,
    $productPrice NUM NOT NULL,
    $productIMG FLOAT NOT NULL,
    $isFavoriteProduct INTEGER NOT NULL,
    $productSize FLOAT NOT NULL,
    $quantity INTEGER NOT NULL
  )
  ''');
  }

  Future<int> insert(ProductModel productModel) async {
    Database db = await instance.database;
    var res = await db.insert(table, productModel.toMap());
    return res;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(table, orderBy: "$productID DESC");
    return res;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$productID = ?', whereArgs: [id]);
  }
  Future updateQuantity(int id, int myQuantity) async {
    Database db = await instance.database;
    return await db.update(table, {quantity: myQuantity},
        where: '$productID = ?', whereArgs: [id]);
  }

  Future clearTable() async {
    Database db = await instance.database;
    return await db.rawQuery("DELETE FROM $table");
  }


}
