import 'package:flutter/material.dart';

class Step1Provider extends ChangeNotifier {
  final data = {
    "data": [
      {
        "title": "Consultation",
        "subtitle": "First visit is free",
        "img": "assets/image1.jpeg",
        "price": "20000"
      },
      {
        "title": "Toothache",
        "subtitle": "You have tooth pain",
        "img": "assets/image2.jpeg",
        "price": "100000"
      },
      {
        "title": "Orthodontics",
        "subtitle": "Braces appointment",
        "img": "assets/image3.jpeg",
        "price": "3500000"
      },
      {
        "title": "Prophylaxis",
        "subtitle": "Teeth cleaning",
        "img": "assets/image4.jpeg",
        "price": "120000"
      },
      {
        "title": "Whitening",
        "subtitle": "Teeth Whitening",
        "img": "assets/image5.jpeg",
        "price": "600000"
      },
      {
        "title": "Hyaluronic Fillers",
        "subtitle": "Throbbing tooth pain",
        "img": "assets/image6.jpeg"
      },
    ]
  };
}
