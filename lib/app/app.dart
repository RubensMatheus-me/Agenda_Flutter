import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/view/contact_form.dart';
import 'package:flutter_agenda/app/view/contact_list.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const CONTACT_FORM = 'contact-form';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HOME: (context) =>  ContactList(),
        CONTACT_FORM: (context) =>  ContactForm()
      },
    );
  }
}