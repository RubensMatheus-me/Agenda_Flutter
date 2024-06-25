import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunchUrlString(url) ? await launchUrlString(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError) {
    _launchApp('tel${contact.telefone}', showModalError);
  }

  launchSMS(Function(BuildContext context) showModalError) {
    _launchApp('sms${contact.telefone}', showModalError);
  }

  launchEmail(Function(BuildContext context) showModalError) {
    _launchApp('mailto${contact.email}', showModalError);
  }
}