import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/database/firestore/contact_dao_firestore.dart';
import 'package:flutter_agenda/app/domain/interface/contact_dao.dart';
import 'package:flutter_agenda/app/domain/services/contact_service.dart';
import 'package:flutter_agenda/firebase_options.dart';
import 'package:get_it/get_it.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  getIt.registerSingleton<ContactDAO>(ContactDaoFirestore());//ContactDAOImp()
  getIt.registerSingleton<ContactService>(ContactService());
  
}