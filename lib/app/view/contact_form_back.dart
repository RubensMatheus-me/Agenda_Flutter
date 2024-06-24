import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/domain/exception/domain_layer_exception.dart';
import 'package:mobx/mobx.dart';

import '../domain/entities/contact.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store{
  late Contact contact;
    //diferenciar novo com alteração
  _ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)?.settings.arguments;
    //contact = (parameter == null) ? Contact() : parameter;
    
    if(parameter == null) {
      contact = Contact();
    } else if(parameter is Contact) {
      contact = parameter;
    } else {
      throw DomainLayerException('Invalid argument type passed to _ContactFormBack. Expected Contact but got ${parameter.runtimeType}');
    }

    //salvar contato


    //validações
  }
}