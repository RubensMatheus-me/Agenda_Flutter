
import 'package:flutter_agenda/app/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection{
  static Database? _db;

  static Future<Database?> get() async {
    if(_db == null) {
      var path = join(await getDatabasesPath(), 'banco_contatos');
      //deleteDatabase(path);
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (_db, version) async {
          await _db.execute(create_table);
          await _db.execute(insert1);
          await _db.execute(insert2);
          await _db.execute(insert3);
        }
        );
    }
    return _db;
  }

}