import 'package:flutter/material.dart';

class MedicalProvider extends ChangeNotifier {
  final data = {
    "data": [
      {
        "name": "Drg. Jessie Ramsley",
        "type": "Consultation",
        "img": "assets/doctorimg1.jpeg",
        "text": "You should do a thorough cleaning of teeth, you ...",
        "date": "20/10/2022"
      },
      {
        "name": "Drg. Zoe Adam",
        "type": "Orthodontist",
        "img": "assets/doctorimg3.jpeg",
        "date": "11/02/2022",
        "text": "Choose Brace 2 and Estimated treatment time is ... ",
      }
    ]
  };
}
