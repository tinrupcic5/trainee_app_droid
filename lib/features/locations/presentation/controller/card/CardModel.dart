import 'package:flutter/material.dart';

class CardModel {
  CardModel(
      {this.title = "",
      this.userName = "",
      this.phoneNumber = "",
      this.createdAt = "",
      this.location = "",
      this.color = Colors.white,
      this.image = ""});

  String title, phoneNumber, image, createdAt;
  String userName, location;
  Color color;
}

CardModel createCustomCardModel(
  String title,
  String subtitle,
  String caption,
  String imagePath,
  String createdAt,
  String location,
) {
  return CardModel(
    title: title,
    userName: subtitle,
    phoneNumber: caption,
    createdAt: createdAt,
    location: location,
    color: Colors.white,
    image: imagePath,
  );
}
