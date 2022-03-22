import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesCRUDHelper {

  MessagesCRUDHelper({required this.userName});

  final fireStore = FirebaseFirestore.instance;
  String userName;



  ///-----------------------Send Message Method
  //sends a new message for the specified user

  List ids = []; //empty list for storing un-sent messages

  pushData(String message) async{

    DateTime timeId = DateTime.now();
    ids.add(timeId);

    await fireStore.collection('user $userName').doc(timeId.toString()).set({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
      'status' : false


    }).whenComplete(() { //SUCCESSFUL - message was successfully sent

      //update every un-sent message with its new status
      for (var element in ids) {
        updateMessageStatus(element.toString());
      }

      //clear old list of un-sent messages
      ids.clear();
    });
  }

  ///-----------------------Update Message Method
  //update when your message is successfully sent
  updateMessageStatus (String id) async{
    await fireStore.collection('user $userName').doc(id).update({
      'status' : true

    });
  }

}