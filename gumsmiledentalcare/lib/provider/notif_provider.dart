import 'package:flutter/material.dart';

class NotificatioProvider extends ChangeNotifier {
  final notif = {
    "data": [
      {
        "text": "Congratulations your appointment success",
        "subtitle": "Thanks for choosing our dental",
        "time": "now",
      },
      {
        "text": "Congratulations your appointment will be send to server",
        "subtitle": "Thanks for choosing our dental",
        "time": "yesterday",
      },
      {
        "text": "Success to cancel you appointment",
        "subtitle": "Thanks for choosing our dental",
        "time": "yesterday",
      },
    ],
  };
}
