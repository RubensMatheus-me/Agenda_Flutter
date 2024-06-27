import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_agenda/app/domain/entities/contact.dart';
import 'package:flutter_agenda/app/domain/interface/contact_dao.dart';

class ContactDaoFirestore implements ContactDAO{
  late CollectionReference contactCollection;
  
  ContactDaoFirestore() {
    contactCollection = FirebaseFirestore.instance.collection('contact');
  }

  @override
  Future<List<Contact>> find() async {
    var result = await contactCollection.get();
    return result.docs.map(
      (doc) => Contact(
        id:doc.reference.id.toString(),
        nome:doc['nome'],
        email:doc['email'],
        telefone:doc['telefone'],
        url_avatar:doc['url_avatar']
      )
    ).toList();
  } 

  @override
  remove(id) {
    contactCollection.doc(id).delete();
  }

  @override
  save(Contact contact) {
    contactCollection.doc(contact.id).set({
      'nome':contact.nome,
      'email':contact.email,
      'telefone':contact.telefone,
      'url_avatar':contact.url_avatar
    });
  }
  
}