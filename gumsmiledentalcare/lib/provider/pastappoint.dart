import 'package:flutter/material.dart';

class PastAppoint extends ChangeNotifier {
  final past = {
    "data": [
      {
        "name": "Drg. Zoe Adam",
        "type": "Orthodontist",
        "img": "assets/doctorimg3.jpeg",
        "date": "11/01/2023",
        "time": "10:25 AM"
      },
      {
        "name": "Drg. Zein Aldebaran",
        "type": "Hyaluronic Fillers",
        "img": "assets/doctorimg6.jpeg",
        "date": "15/08/2022",
        "time": "08:05 PM"
      },
      {
        "name": "Drg. Zein Aldebaran",
        "type": "Prophylaxis",
        "img": "assets/doctorimg6.jpeg",
        "date": "02/04/2022",
        "time": "04:25 PM"
      },
    ]
  };
}
