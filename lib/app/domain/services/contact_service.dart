import 'package:flutter_agenda/app/domain/interface/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService{
  var dao = GetIt.I.get<ContactDAO>();

}