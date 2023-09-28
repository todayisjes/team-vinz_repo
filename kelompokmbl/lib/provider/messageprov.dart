import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  final chat = {
    "data": [
      {
        "img": "assets/doctorimg1.jpeg",
        "doctor": "Drg. Jessie Ramsley",
        "text": "Will you come to clinic at 7 pm ?",
        "time": "10.00 am"
      },
      {
        "img": "assets/doctorimg3.jpeg",
        "doctor": "Drg. Zoe Adam",
        "text": "thankyou doctor",
        "time": "yesterday"
      },
      {
        "img": "assets/doctorimg6.jpeg",
        "doctor": "Drg. Zein Aldebaran",
        "text": "Hahaha, whatever",
        "time": "01/07/2023",
      },
      {
        "img": "assets/doctorimg2.jpeg",
        "doctor": "Drg. Thalia Smith",
        "text": "Hello, you can ask me if i was online",
        "time": "20/06/2023",
      },
      {
        "img": "assets/doctorimg4.jpeg",
        "doctor": "Drg. Josh Alexander",
        "text": "Hello, you can ask me if i was online",
        "time": "20/06/2023",
      },
      {
        "img": "assets/doctorimg5.jpeg",
        "doctor": "Drg. Xavierra Ailen",
        "text": "Hello, you can ask me if i was online",
        "time": "20/06/2023",
      },
    ]
  };
}
