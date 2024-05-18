import 'dart:async';

import 'package:demo_photo_marker/add_marker/widgets/app_tap_to_mark.dart';
import 'package:demo_photo_marker/add_marker/widgets/app_catpture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoom_widget/zoom_widget.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Photo Marker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
      ),
      body: centerLayout(
        [
          AppCapture(
              child: zoomWrapper(markWrapper(photo()))
          ),
        ]
      ),
    );
  }

  Widget centerLayout(
    List<Widget> widgets,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    );
  }

  Widget zoomWrapper(
      Widget child,
  ) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxScale = 1.6;

    return SizedBox(
      width: screenWidth,
      height: screenWidth,
      child: Zoom(
          maxZoomWidth: screenWidth * maxScale,
          maxZoomHeight: screenWidth * maxScale,
          centerOnScale: true,
          enableScroll: true,
          doubleTapZoom: true,
          backgroundColor: Colors.amber,
          colorScrollBars: Colors.grey,
          opacityScrollBars: 0.85,
          scrollWeight: 5.0,
          child: child,
      )
    );
  }

  Widget markWrapper(Widget child) {
    return AppTapToMark(
      underChild: child
    );
  }

  Widget photo() {
    return Container(
      color: Colors.grey,
      child: const Image(
        image: AssetImage("assets/house_map.jpeg"),
      ),
    );
  }
}
