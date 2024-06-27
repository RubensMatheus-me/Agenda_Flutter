
import 'package:flutter_agenda/app/domain/entities/contact.dart';

abstract class ContactDAO{

  save(Contact contact);

  Future<List<Contact>> find();

  remove(dynamic id);
}