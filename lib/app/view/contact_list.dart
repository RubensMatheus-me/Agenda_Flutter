import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/app.dart';

class ContactList extends StatelessWidget{
  final list = [
    {'nome':'Pietro','telefone':'(11) 9 9874-5656','avatar':'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png'},
    {'nome':'Rubens','telefone':'(44) 9 9712-2777','avatar':'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png'},
    {'nome':'Joana','telefone':'(11) 9 9562-3356','avatar':'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png'},
  ];

  ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed:() {
              Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
            }
            )
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder:(context, i){
          var contact = list[i];
          var avatar = CircleAvatar( backgroundImage: NetworkImage(contact['avatar'] ?? 'Dont have avatar'),);
          return ListTile(
            leading: avatar,
            title: Text(contact['nome']  ?? 'Unknown Contact'),
            subtitle: Text(contact['telefone']?? 'No phone number'),
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
  }
}