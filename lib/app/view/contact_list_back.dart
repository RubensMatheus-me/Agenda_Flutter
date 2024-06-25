import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/app.dart';
import 'package:flutter_agenda/app/domain/entities/contact.dart';
import 'package:flutter_agenda/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';


part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store{
  var _service = GetIt.I.get<ContactService>();


//definir lista de contatos
  @observable
  Future<List<Contact>> ?list;
  
//ter um metodo para atualizar a lista de contatos
@action
refreshList([dynamic value]) {
  list = _service.find();
}

_ContactListBack(){
  refreshList();
}
//ter um metodo para chamar o form salvar/alterar
goToForm(BuildContext context, [Contact? contact]) {
 Navigator.of(context).pushNamed(MyApp.CONTACT_FORM, arguments: contact).then(refreshList);

}
//excluir
remove(int ?id) {
  _service.remove(id);
  refreshList();
}
}