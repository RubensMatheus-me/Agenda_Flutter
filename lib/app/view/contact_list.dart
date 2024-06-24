import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/app.dart';
import 'package:flutter_agenda/app/domain/entities/contact.dart';
import 'package:flutter_agenda/app/view/contact_list_back.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactList extends StatelessWidget{

  final _back = ContactListBack();
    
  CircleAvatar circleAvatar(String url) {
    return (Uri.tryParse(url)!.isAbsolute) ?
      CircleAvatar(backgroundImage: NetworkImage(url))
     : CircleAvatar(child: Icon(Icons.person));
    }
 
  Widget iconEditButton(Function()? onPressed) {
    return IconButton(
      icon: Icon(Icons.edit),
      color: Colors.orange,
      onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, Function()? remove) {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirmar a Exclusão?'),
            actions: [
              TextButton(
                child: Text('Não'),
                onPressed: () {
                  Navigator.of(context).pop();//fechar confirmaçao
                },
              ),
              TextButton(
                child: Text('Sim'),
                onPressed: remove, //cojfirmar remoção
              ),
            ],
          )
        );
      },
    );
  }
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Text('Lista de Contatos'),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed:() {
                    Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
                  }
                )
              ],
            ),
            body: Observer(builder: (context) {
              return FutureBuilder(
                future: _back.list,
                builder: (context, future) {
                  if(!future.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                      List<Contact>? list = future.data;    
                      return ListView.builder (
                        itemCount: list?.length,
                        itemBuilder:(context, i){
                          var contact = list?[i];
                          return ListTile(
                            leading: circleAvatar(contact?.url_avatar ?? ''),
                            title: Text(contact?.nome  ?? 'Unknown Contact'),
                            subtitle: Text(contact?.telefone?? 'No phone number'),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  iconEditButton(() {
                                    _back.goToForm(context, contact);
                                  }),
                                  iconRemoveButton(context, () {
                                    _back.remove(contact!.id);
                                    Navigator.of(context).pop();
                                  })
                                ],
                              ),   
                            ),
                          );
                        },
                      );
                  }
                }
              );
            }
            )
    );
                  
  }
}