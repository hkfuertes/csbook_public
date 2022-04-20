import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Logo extends StatelessWidget {
  double size;
  Logo({Key? key, this.size = 64}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.dove,
          size: size,
        ),
        Container(
          width: 8,
        ),
        Text(
          "CS",
          style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
        ),
        Text(
          "Book",
          style:
              TextStyle(fontSize: size, color: Colors.white.withOpacity(0.7)),
        )
      ],
    );
  }
}
