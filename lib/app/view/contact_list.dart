import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/app.dart';
import 'package:flutter_agenda/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:flutter_agenda/app/domain/entities/contact.dart';

class ContactList extends StatelessWidget{

  Future<List<Contact>?> _search() async {
    try {
      return ContactDAOImpl().find();

    }catch(e) {
      print('Erro ao acessar o banco de dados $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future:  _search(),
      builder: (context, future) {
        if(future.hasData) {
          List<Contact>? list = future.data;
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
            body: ListView.builder (
              itemCount: list?.length,
              itemBuilder:(context, i){
                var contact = list?[i];
                var avatar =  CircleAvatar( backgroundImage: NetworkImage(contact?.url_avatar ?? 'Dont have avatar'),);
                return ListTile(
                  leading: avatar,
                  title: Text(contact?.nome  ?? 'Unknown Contact'),
                  subtitle: Text(contact?.telefone?? 'No phone number'),
                  trailing: const SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.edit), onPressed: null,),
                        IconButton(icon: Icon(Icons.delete), onPressed: null,),
                      ],
                      ),
                  ),
                );
              },
            )
          );
        }else {
          return Scaffold();
        }
      });
  }
}