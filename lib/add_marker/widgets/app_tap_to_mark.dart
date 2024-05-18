import 'package:flutter/material.dart';

class AppTapToMark extends StatefulWidget {
  final Widget underChild;

  const AppTapToMark({required this.underChild, super.key});
  
  @override
  State<StatefulWidget> createState() => _AppTapToMarkState();
}

class _AppTapToMarkState extends State<AppTapToMark> {
  Offset? tappedPos;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTapUp: (TapUpDetails eventDetails) {
          setState(() {
            tappedPos = Offset(eventDetails.localPosition.dx, eventDetails.localPosition.dy);
          });
        },
        child: Stack(
          children: [
            widget.underChild,
            tappedPos != null ?
            Positioned(
              top: (tappedPos?.dy ?? 24) - 24,
              left: (tappedPos?.dx ?? 24) - 24,
              child: markerIcon(),
            ) : const Spacer(),
          ],
        ),
      ),
    );
    // return Center(
    //   child: GestureDetector(
    //     onTapUp: (TapUpDetails eventDetails) {
    //       setState(() {
    //         tappedPos = Offset(eventDetails.localPosition.dx, eventDetails.localPosition.dy);
    //       });
    //     },
    //     child: Stack(
    //       children: [
    //         widget.underChild,
    //         tappedPos != null ?
    //         Positioned(
    //           top: (tappedPos?.dy ?? 24) - 24,
    //           left: (tappedPos?.dx ?? 24) - 24,
    //           child: markerIcon(),
    //         ) : const Spacer(),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget markerIcon() {
    return const Icon(
      Icons.place,
      color: Colors.blue,
      size: 24.0,
      semanticLabel: "Marker icon",
    );
  }
}
