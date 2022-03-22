
import 'package:flutter/material.dart';

import '../../controller/crud/users_crud_helper.dart';


class DialogBoxScreen {


  BuildContext context;
  Widget? cancelButton;
  Widget? continueButton;

  TextEditingController dialogTextEditingController;

  DialogBoxScreen(this.context, this.dialogTextEditingController, {Key? key}) {

    /// Set-up buttons inside of constructor

    ///                                                                         /Cancel Button
    cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop(); // dismiss dialog
        dialogTextEditingController.clear();
      },
    );


    ///                                                                         /Continue Button
    continueButton = TextButton(
      child: const Text("Add"),
      onPressed:  () {
        Navigator.of(context).pop(); // dismiss dialog

        if(dialogTextEditingController.text.isNotEmpty) {
          UsersCRUDHelper().addNewUser(dialogTextEditingController.text);
        }

        dialogTextEditingController.clear();
      },
    );

  }




  showAlert () {
    AlertDialog alertDialog = AlertDialog(
      title: const Text("Add a new user"),
      content: TextFormField(
        controller: dialogTextEditingController,
        decoration: const InputDecoration(
            hintText: "enter new user name"
        ),
      ),
      actions: [
        cancelButton!,
        continueButton!,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

}


// set up the AlertDialog


    // show the dialog

