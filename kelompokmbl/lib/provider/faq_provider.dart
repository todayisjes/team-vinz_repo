import 'package:flutter/material.dart';

class FAQScreen {
  final String title;

  const FAQScreen({
    required this.title,
  });
}

const allFAQ = [
  FAQScreen(
    title: "Apa saja pelayanan di GumSmile Dental Care",
  ),
  FAQScreen(title: "Berapa lama perawatan Orthodontic berlangsung"),
  FAQScreen(
      title: "Apa saja efek samping dari penggunaan perawatan Orthodontic"),
  FAQScreen(title: "Apa kita harus membuat janji temu telebih dahulu"),
  FAQScreen(title: "Bisa membayar secara tunai tidak")
];
