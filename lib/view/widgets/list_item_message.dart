import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_firebase_project/view/widgets/text_message_widget.dart';
import 'package:new_firebase_project/view/widgets/time_stamp_widget.dart';

class ListItemMessage extends StatelessWidget {
  ListItemMessage(this.index, this.snapshot, {Key? key}) : super(key: key);

  AsyncSnapshot<QuerySnapshot> snapshot;
  int index;


  @override
  Widget build(BuildContext context) {
    //snapshot.data!.docs[index]['message']['text']

    ///                                                                         /Attributes
    ///                                                                         Align and Wrap
    return Row( //you can use widget called Align
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),

          ///                                                                   /Attributes
          ///                                                                   Color and Radius
          child: Container(
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20)
            ),


            child: Padding(
              padding: const EdgeInsets.all(10),

              ///                                                               /Fields
              child: Row(
                children: [

                  ///                                                           /Text Widget
                  ///                                                           for showing user message
                  TextMessageWidget(
                    textMessage: snapshot.data!.docs[index]['message']
                  ),


                  ///                                                           /Text Widget
                  ///                                                           for showing time of message
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: TimeStampWidget(
                        timestamp: snapshot.data!.docs[index]['timestamp']
                    ),
                  ),


                  ///                                                           /Icon
                  ///                                                           for message send status
                   snapshot.data!.docs[index]['status']
                       ? const Icon(Icons.check)
                       : const Icon(Icons.access_time_filled_rounded)

                ],
              ),
            ),
          ),
        ),
      ],
    );
}

}