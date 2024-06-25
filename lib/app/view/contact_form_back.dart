import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/domain/exception/domain_layer_exception.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../domain/entities/contact.dart';
import '../domain/services/contact_service.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store{
  late Contact contact;
  var _service = GetIt.I.get<ContactService>();

  @observable
  bool _nameIsValid = false;
  @observable
  bool _emailIsValid = false;
  @observable
  bool _phoneIsValid = false;

  @computed
  bool get isValid => _nameIsValid && _emailIsValid && _phoneIsValid;

    //diferenciar novo com alteração
  _ContactFormBack (BuildContext context) {
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
  
  @action
  save() async {
    await _service.save(contact);
  }

    //validações
  @action
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

  @action
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

  @action
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