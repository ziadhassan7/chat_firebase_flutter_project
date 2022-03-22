import 'package:cloud_firestore/cloud_firestore.dart';

import 'messages_crud_helper.dart';

class UsersCRUDHelper {

  final fireStore = FirebaseFirestore.instance;


  ///----------------------- Add new User Method
  addNewUser(String userName) async{
    await fireStore.collection('all users').doc(DateTime.now().toString()).set({
      'username': userName,

    });

    MessagesCRUDHelper(userName: userName).pushData("Welcome message!");

  }
}