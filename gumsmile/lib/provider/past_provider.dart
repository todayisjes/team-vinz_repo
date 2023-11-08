import 'package:flutter/material.dart';
import 'package:gumsmile/model/appointment_model.dart';

class PastProvider extends ChangeNotifier {
  final AppointmentModel data = AppointmentModel(
      doctorName: "Drg. Zein Aldebaran",
      picture: "assets/dokter/doctorimg6.jpeg",
      treatmentType: "Orthodentist",
      date: "2023-10-18",
      time: "7:20 PM");
}
