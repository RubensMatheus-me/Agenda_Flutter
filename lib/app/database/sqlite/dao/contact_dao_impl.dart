import 'package:flutter_agenda/app/database/sqlite/connection.dart';
import 'package:flutter_agenda/app/domain/entities/contact.dart';
import 'package:flutter_agenda/app/domain/interface/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAOImpl implements ContactDAO{
  Database? _db;

  @override
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    //_db?.query('contact');

    List<Map<String,dynamic>> result = await _db!.query('contact');
    List<Contact> list = List.generate(result.length, (i) {
      var line = result[i];
      return Contact(
        id: line['id'],
        nome: line['nome'],
        telefone: line['telefone'],
        email: line['email'],
        url_avatar: line['url_avatar'],
      
      );
    }
    );
    return list;
  }

  @override
  Future<void> remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM contact WHERE id = ?';
    _db?.rawDelete(sql, [id]);

  }

  @override
  save(Contact contact) async {
    _db = await Connection.get();
    var sql;

    if(contact.id == null) {
      sql = 'INSERT INTO contact (nome, telefone, email, url_avatar) VALUES (?, ?, ?, ?)';
      _db?.rawInsert(sql, [contact.nome, contact.telefone, contact.email, contact.url_avatar]);
    }else {
      sql = 'UPDATE contact SET nome = ?, telefone = ?, email = ?, url_avatar = ? WHERE id = ?';
      _db?.rawUpdate(sql,[contact.nome, contact.telefone, contact.email, contact.url_avatar, contact.id]);
    }
  }

  /*
    if(contact.id) {
      sql = 'UPDATE contact SET nome = ?, telefone = ?, email = ?, url_avatar = ?, WHERE id = ?';
      _db?.rawUpdate(sql,[contact.nome, contact.telefone, contact.email, contact.url_avatar, contact.id]);
    }else {
      sql = 'INSERT INTO contact (nome, telefone, email, url_avatar) VALUES(?, ?, ?, ?)';
      _db?.rawInsert(sql,[contact.nome, contact.telefone, contact.email, contact.url_avatar]);
    }
  */
  
}