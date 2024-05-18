import 'dart:typed_data';

import 'package:flutter/material.dart';

class MarkedPhotoResultScreen extends StatefulWidget {
  final Uint8List? capturedImage;

  const MarkedPhotoResultScreen({this.capturedImage, super.key});

  @override
  State<MarkedPhotoResultScreen> createState() => _MarkedPhotoResultScreenState();
}

class _MarkedPhotoResultScreenState extends State<MarkedPhotoResultScreen> {
  @override
  Widget build(BuildContext context) {
    final memoryImg = widget.capturedImage;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 24, semanticLabel: "Back button",),
          onPressed: () {
            Navigator.pop(context);
          },
          iconSize: 24,
        ),
        title: const Text("Marked Photo Result", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          children: [
            memoryImg != null ? Image.memory(memoryImg) : const Text("Failed to shown")
          ],
        ),
      ),
    );
  }
}
