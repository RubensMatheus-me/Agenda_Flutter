import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/view/contact_details.back.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../domain/entities/contact.dart';

class ContactDetails extends StatelessWidget {

  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta'),
      content: Text('Não foi possível encontrar um APP compatível.'),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var radius = width / 3;
        //var heigth = constraints.biggest.height;

        return Scaffold(
          body: ListView( 
            padding: EdgeInsets.all(60),
            children: [
              (Uri.tryParse(contact.url_avatar ?? '')?.isAbsolute ?? false) ?
              CircleAvatar(
                backgroundImage: NetworkImage(contact.url_avatar!),
                radius: radius,
                ) :
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  size:  width / 2,),
                radius: radius,
                ),
              
              Center(
                child: Text('${contact.nome}', style: TextStyle(fontSize: 30),),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone:'),
                  subtitle: Text('${contact.telefone}'),
                  trailing: Container( 
                    width: width / 4,
                    child: Row(
                      children: [
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.message),
                          onPressed: () {
                            _back.launchSMS(showModalError);
                          },
                        ),
                        IconButton(
                          color: Colors.blue,
                          icon: Icon(Icons.phone),
                          onPressed: () {
                            _back.launchPhone(showModalError);
                          },
                        )
                      ],
                      ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('E-mail:'),
                  onTap: () {
                    _back.launchEmail(showModalError);
                  },
                  subtitle: Text('${contact.email}'),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
      );
      
    
  }
}