import 'package:flutter_agenda/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:flutter_agenda/app/domain/interface/contact_dao.dart';
import 'package:flutter_agenda/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

setupInjection() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}