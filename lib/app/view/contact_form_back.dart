import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/domain/exception/domain_layer_exception.dart';
import 'package:get_it/get_it.dart';

import '../domain/entities/contact.dart';
import '../domain/services/contact_service.dart';



class ContactFormBack {
  Contact contact = Contact();
  var _service = GetIt.I.get<ContactService>();

  bool _nameIsValid = false;
  bool _emailIsValid = false;
  bool _phoneIsValid = false;

  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

  //diferenciar novo com alteração
  ContactFormBack (BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments;

    //contact = (parameter == null) ? Contact() : parameter;
    if(parameter == null) {
      contact = Contact();
    } else if(parameter is Contact) {
      contact = parameter;
    } else {
      throw DomainLayerException('Invalid argument type passed to _ContactFormBack. Expected Contact but got ${parameter.runtimeType}');
    }
  }

  //salvar contato
  save() async {
    await _service.save(contact);
  }

  //validações

  String? validateName(String? name) {
    try {
      _service.validateName(name);
      _nameIsValid = true;
      return null;
    }catch(e) {
      _nameIsValid = false;
      return e.toString();

    }
  }


  String? validateEmail(String? email) {
    try {
      _service.validateEmail(email);
      _emailIsValid = true;
      return null;
    }catch(e) {
      _emailIsValid = false;
      return e.toString();

    }
  }


  String? validatePhone(String? phone) {
    try {
      _service.validatePhone(phone);
      _phoneIsValid = true;
      return null;
    }catch(e) {
      _phoneIsValid = false;
      return e.toString();

    }
  }
}