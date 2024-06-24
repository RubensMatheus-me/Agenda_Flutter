import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget{

  Widget fieldName() {
    return TextFormField(
      decoration: InputDecoration( 
        labelText: 'Nome'
      ),
    );
  }

  Widget fieldEmail() {
    return TextFormField(
      decoration: InputDecoration( 
        labelText: 'E-mail'
      ),
    );
  }

  Widget fieldPhone() {
    var maskNumber = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
      inputFormatters: [maskNumber],
      keyboardType: TextInputType.number,
      decoration: InputDecoration( 
        labelText: 'Telefone',
        hintText: '(99) 9 9999-9999'
        
      ),
    );
  }

  Widget fieldURLImage() {
    return TextFormField(
      decoration: InputDecoration( 
        labelText: 'URL Imagem',
        hintText: 'https://www.site.com'
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Contato'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: null)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              fieldName(),
              fieldEmail(),
              fieldPhone(),
              fieldURLImage()
            ],
          ),
        ),
      ),
    );
  }
}