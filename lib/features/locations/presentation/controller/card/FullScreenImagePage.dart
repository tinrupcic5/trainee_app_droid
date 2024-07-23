import 'package:flutter/material.dart';

class FullScreenImagePage extends StatelessWidget {
  final String url;

  const FullScreenImagePage({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color remains black for full-screen display
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54, // Slightly transparent black
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Optional: Add title or other actions here if needed
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(url),
        ),
      ),
    );
  }
}
