import 'package:flutter/material.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';

class FullScreenImagePage extends StatelessWidget {
  final String url;
  final String contentComment;
  final UserLoginResponse userLogintoken;

  const FullScreenImagePage({
    required this.url,
    required this.userLogintoken,
    required this.contentComment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            // Swipe to the right
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: InteractiveViewer(
                child: Image.network(
                  url,
                  headers: {
                    'Authorization': 'Bearer ${userLogintoken.token}',
                  },
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 52, 52, 52).withOpacity(0.5),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                contentComment,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
