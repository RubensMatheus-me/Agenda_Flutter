import 'package:flutter/material.dart';

import '../domain/entities/contact.dart';

class ContactDetailsBack {
  BuildContext context;
  Contact contact = Contact();

  //dados do contato
  ContactDetailsBack(this.context) {
    contact = ModalRoute.of(context)?.settings.arguments as Contact;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

}