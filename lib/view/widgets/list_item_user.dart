import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_firebase_project/view/screens/chat_screen.dart';

import '../../controller/text_formatter_helper.dart';

class ListItemUser extends StatelessWidget {
  ListItemUser(this.index, this.snapshot, {Key? key}) : super(key: key);

  AsyncSnapshot<QuerySnapshot> snapshot;
  int index;


  @override
  Widget build(BuildContext context) {
    ///                                                                         /Inkwell -
    ///                                                                         to handle item click
    ///                                                                         moves user to chat screen
    return InkWell(

      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) =>
                    ChatScreen(snapshot.data!.docs[index]['username'])
            ));
      },


      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, //aligns names to the left side
        children: [

          Padding(
            padding: const EdgeInsets.all(15),

            child: Row(
              children: [

                ///                                                             CircleAvatar -
                ///                                                             for showing the first
                ///                                                             two letters of username
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text(TextFormatterHelper()
                        .getFirstLettersOfName(snapshot.data!.docs[index]['username'])),
                  ),
                ),


                ///                                                             Text Widget -
                ///                                                             for showing user name
                Text(
                  snapshot.data!.docs[index]['username'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
              ],
            ),
          ),


          ///                                                                   /Divider Widget -
          ///                                                                   splitter line.
          const Divider(),
        ],
      ),
    );
  }
}
