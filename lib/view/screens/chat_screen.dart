import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../controller/crud/messages_crud_helper.dart';
import '../widgets/list_item_message.dart';


class ChatScreen extends StatelessWidget {
  ChatScreen(this.userName, {Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();


  final fireStore = FirebaseFirestore.instance;
  final _messageFormField = TextEditingController();

  String userName;

  ///-----------------------Widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),

      body: Column(
        children: [
          ///                                                                   /List View -
          ///                                                                   for showing messages
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: fireStore.collection('user $userName').orderBy('timestamp', descending: true).snapshots(),
                builder: (context, snapshot) {


                  if (snapshot.hasData){

                    return ListView.builder(
                        reverse: true, //to be scrolled from bottom up (firestore list is also reversed)
                        controller: _scrollController,
                        itemCount: snapshot.data!.docs.length,

                        itemBuilder: (context, index) {
                          return ListItemMessage(index, snapshot);
                        });

                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }

                }
            ),
          ),


          ///                                                                   /TextFormField & Send Button
          ///                                                                   sending messages bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
            child: Row(
              children: [
                Expanded(

                  ///                                                           /TextFormField -
                  ///                                                           text field for typing your message
                child: TextFormField(
                    controller: _messageFormField,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                      hintText: "send message"
                    ),

                  ),
                ),

                ///                                                             /Send Button -
                ///                                                             sends a new message
                ElevatedButton(
                    onPressed: (){
                      MessagesCRUDHelper(userName: userName).pushData(_messageFormField.text);
                      _messageFormField.clear();

                      //animate to last element on list (when you send a message)
                      _scrollController.animateTo(
                        _scrollController.position.minScrollExtent, //we used min because list is reversed
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 1),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Icon(Icons.send, color: Colors.white, size: 30,)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}




