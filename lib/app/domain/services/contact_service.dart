import 'package:flutter_agenda/app/domain/entities/contact.dart';
import 'package:flutter_agenda/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_agenda/app/domain/interface/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService{
  final _dao = GetIt.I.get<ContactDAO>();

  save(Contact contact) {
    validateName(contact.nome);
    validateEmail(contact.email);
    validatePhone(contact.telefone);
    _dao.save(contact);
  }

  remove(dynamic id) {
    if (id == null) {
    throw DomainLayerException("ID cannot be null");
  }
  _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  validateName(String? name) {
    var min = 3;
    var max = 50;

    if(name == null) {
      throw DomainLayerException('O nome é obrigatorio.');
    }else if(name.length < min) {
      throw DomainLayerException('O nome deve possuir pelo menos $min caracteres.');
    }else if(name.length > max) {
      throw DomainLayerException('O nome deve possuir no maximo $max caracteres.');
    }
  }
  validateEmail(String? email) {
    if(email == null) {
      throw DomainLayerException('O email é obrigatorio.');
    }else if(!email.contains('@')){
      throw DomainLayerException('O email deve possuir @.');
    }
  }

  validatePhone(String? phone) {
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if(phone == null) {
      throw DomainLayerException('O telefone é obrigatorio.');
    }else if(!format.hasMatch(phone)) {
      throw DomainLayerException('Formato inválido. O formato deve ser: (99) 9 9999-9999.');
    }

    //serviço de dominio
  }

}