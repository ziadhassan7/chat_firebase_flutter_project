import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/dialog_box_screen.dart';
import '../widgets/list_item_user.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final fireStore = FirebaseFirestore.instance;

  final TextEditingController _dialogFormFieldController = TextEditingController();


  ///-----------------------Widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: StreamBuilder<QuerySnapshot>(
          stream: fireStore.collection('all users').snapshots(),
          builder: (context, snapshot) {


            if (snapshot.hasData){

              return snapshot.data?.size == 0
                ? const Center(child: Text("There is no users, create one!"),)

                : ListView.builder(
                  itemCount: snapshot.data!.docs.length,

                  itemBuilder: (context, index) {
                    return ListItemUser(index, snapshot);
                  });


            } else {
              return const Center(child: CircularProgressIndicator(),);
            }

          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DialogBoxScreen(context, _dialogFormFieldController).showAlert();
        },

        child: const Icon(Icons.add),
      ),
    );
  }




}
