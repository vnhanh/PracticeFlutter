import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../mark_result/marked_photo_result_screen.dart';

class AppCapture extends StatefulWidget {
  final Widget child;

  const AppCapture({required this.child, super.key});

  @override
  State<StatefulWidget> createState() => _AppCaptureState();
}

class _AppCaptureState extends State<AppCapture> {
  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    print("TestAlan - App Capture - initState");
  }

  // Future<void> _captureImageOfChildView() async {
  //   RenderRepaintBoundary? boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
  //
  //   ui.Image? image = await boundary?.toImage();
  //   ByteData? byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List? pngBytes = byteData?.buffer.asUint8List();
  //   String log;
  //   if (pngBytes != null) {
  //     log = "pngBytes $pngBytes";
  //   } else {
  //     log = "pngBytes is null";
  //   };
  //   print(log);
  // }

  ScreenshotController screenshotController = ScreenshotController();
  String fileName = "";
  String path = "";

  Future<void> captureAndSaveToFile() async {
    if (path.isEmpty) path = (await getApplicationDocumentsDirectory()).path;
    // fileName = DateTime.now().microsecondsSinceEpoch.toString();
    fileName = "flutter-capture.jpeg";
    screenshotController.captureAndSave(path, fileName: fileName);
  }

  // Future<void> captureAndSaveToGallery() async {
  //   await screenshotController.capture(delay: const Duration(milliseconds: 10)).then((Uint8List? image) async {
  //     if (image != null) {
  //       final directory = await getApplicationDocumentsDirectory();
  //       final imagePath = await File('${directory.path}/image.png').create();
  //       await imagePath.writeAsBytes(image);
  //
  //       /// Share Plugin
  //       await Share.shareFiles([imagePath.path]);
  //     }
  //   });
  // }

  @override
  Widget build( context) {
    return Column(
      children: [
        Screenshot(
          controller: screenshotController,
          child: widget.child,
        ),
        MaterialButton(
          onPressed: () {
            screenshotController.capture().then((Uint8List? image) {
              setState(() {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => MarkedPhotoResultScreen(capturedImage: image)),
                );
              });
            }).catchError((error) {
              print("...capture failed with exception $error");
            });
            captureAndSaveToFile();
          },
          child: const Text("CAPTURE"),
        )
      ],
    );
  }

}
