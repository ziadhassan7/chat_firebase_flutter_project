import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../controller/time_formatter_helper.dart';

class TimeStampWidget extends StatelessWidget {


  Timestamp? timestamp;
  DateTime? time;


  TimeStampWidget({this.timestamp, Key? key}) : super(key: key){
    //get device time till server time is delivered
    timestamp == null ? time = DateTime.now() : time = timestamp?.toDate();
  }


  @override
  Widget build(BuildContext context) {
    return Text(
        TimeFormatterHelper().
        getFullFormattedTime(time!.hour, time!.minute),

        style: const TextStyle(color: Colors.white38)
    );
  }
}
