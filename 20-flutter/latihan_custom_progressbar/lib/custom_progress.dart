import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double width;

  CustomProgressBar(this.width);
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.timer),
      Stack(children: [
        Container(
          width: width,
          height: 10,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
        ),
        Material(
          borderRadius: BorderRadius.circular(5),
          child: AnimatedContainer(
            width: width * 0.5,
            height: 10,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ])
    ]);
  }
}
