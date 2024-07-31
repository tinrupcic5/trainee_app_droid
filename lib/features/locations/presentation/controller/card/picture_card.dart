import 'package:flutter/material.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/files/domain/file_uri_response.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/FullScreenImagePage.dart';

class PictureCard extends StatefulWidget {
  final FileUriResponse picture;
  final UserLoginResponse userLogintoken;

  const PictureCard({
    required this.picture,
    required this.userLogintoken,
    super.key,
  });

  @override
  _PictureCardState createState() => _PictureCardState();
}

class _PictureCardState extends State<PictureCard> {
  @override
  void initState() {
    super.initState();
  }

  Widget fetchImage() {
    return Image.network(
      widget.picture.uri!,
      headers: {
        'Authorization': 'Bearer ${widget.userLogintoken.token}',
      },
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center the image and use AspectRatio
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImagePage(
                    url: widget.picture.uri!,
                    userLogintoken: widget.userLogintoken,
                    contentComment: widget.picture.contentComment!,
                  ),
                ),
              );
            },
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                alignment: Alignment.center,
                child: fetchImage(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.picture.contentComment!,
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
