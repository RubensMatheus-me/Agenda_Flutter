import 'package:flutter/material.dart';
import 'package:flutter_agenda/app/view/contact_form_back.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget{  
  final _form = GlobalKey<FormState>();

  Widget fieldName(ContactFormBack back) {
    return TextFormField(
      validator: back.validateName,
      onSaved: (newValue) => back.contact.nome = newValue,
      initialValue: back.contact.nome,
      decoration: InputDecoration( 
        labelText: 'Nome'
      ),
    );
  }

  Widget fieldEmail(ContactFormBack back) {
    return TextFormField(
      validator: back.validateEmail,
      onSaved: (newValue) => back.contact.email = newValue,
      initialValue: back.contact.email,
      decoration: InputDecoration( 
        labelText: 'E-mail'
      ),
    );
  }

  Widget fieldPhone(ContactFormBack back) {
    var maskNumber = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
      validator: back.validatePhone,
      onSaved: (newValue) => back.contact.telefone = newValue,
      initialValue: back.contact.telefone,
      inputFormatters: [maskNumber],
      keyboardType: TextInputType.number,
      decoration: InputDecoration( 
        labelText: 'Telefone',
        hintText: '(99) 9 9999-9999',
      ),
    );
  }

  Widget fieldURLImage(ContactFormBack back) {
    return TextFormField(
      onSaved: (newValue) => back.contact.url_avatar = newValue,
      initialValue: back.contact.url_avatar,
      decoration: InputDecoration( 
        labelText: 'URL Imagem',
        hintText: 'https://www.site.com'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Cadastrar Contato'),
        actions: [
          IconButton(icon: Icon(Icons.save), 
          onPressed: () {
            _form.currentState?.validate();
            if(_back.isValid) {
              _form.currentState?.save();
              _back.save();
              Navigator.of(context).pop();
            }
          })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              fieldName(_back),
              fieldEmail(_back),
              fieldPhone(_back),
              fieldURLImage(_back)
            ],
          ),
        ),
      ),
    );
  }
}