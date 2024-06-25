import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase{
  init_db() async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath,'note.db');
    Database mydb = await openDatabase(path,onCreate: _onCreate,version: 5,onUpgrade: _onUpgrade);
    return mydb;
  }
  _onCreate(Database db, int version) async{
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE "favorite_quotes"(
        "content" VARCHAR(50) NOT NULL,
        "author" VARCHAR(50) NOT NULL,
        "_id" VARCHAR(50) NOT NULL
      )
     ''');
    await batch.commit();
    print('on create--------------------------------------------');
  }
  delete_database() async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath,'note.db');
    await deleteDatabase(path);
  }
  _onUpgrade(Database db,int oldVersion,newVersion){
    print("on upgrade-------------------------------------------------------");
  }
  Database? _db;
  Future<Database?> get db async{
    if(_db == null){
      _db = await init_db();
      return _db;
    }else{
      return _db;
    }
  }
  insert_data(String sql) async {
    Database? mydb = await db;
    await mydb!.rawInsert(sql);
  }

  delete_data(String sql) async {
    Database? mydb = await db;
    await mydb!.rawDelete(sql);
  }

  update_data(String sql) async {
    Database? mydb = await db;
    await mydb!.rawUpdate(sql);
  }

  show_data(String sql) async {
    Database? mydb = await db;
    List<Map> data = await mydb!.rawQuery(sql);
    return data;
  }



}