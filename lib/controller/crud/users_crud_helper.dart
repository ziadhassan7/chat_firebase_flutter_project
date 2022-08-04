import 'package:cloud_firestore/cloud_firestore.dart';

import 'messages_crud_helper.dart';

class UsersCRUDHelper {

  final fireStore = FirebaseFirestore.instance;


  ///----------------------- Add new User Method
  addNewUser(String userName) async{
    await fireStore.collection('all users').doc('user $userName').set({
      'username': userName,

    });

    MessagesCRUDHelper(userName: userName).pushData("Welcome message!");

  }


  ///----------------------- Delete a User Method
  deleteUser(String id) async {

    await fireStore.collection('all users').doc('user $id').delete();

    //iterate over large number of documents and delete it
    //more information: https://stackoverflow.com/questions/53089517/how-to-delete-all-documents-in-collection-in-firestore-with-flutter
    final batch = fireStore.batch();
    var collection = fireStore.collection('user $id');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();

  }
}