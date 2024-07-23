import 'package:flutter/material.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/FullScreenImagePage.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/picture_item.dart';

class PictureCard extends StatelessWidget {
  final PictureItem picture;

  const PictureCard({required this.picture, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use GestureDetector to handle taps
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImagePage(url: picture.url),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                picture.url,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              picture.pictureComment,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
