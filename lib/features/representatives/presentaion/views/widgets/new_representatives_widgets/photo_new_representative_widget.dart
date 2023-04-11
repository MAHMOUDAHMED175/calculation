import 'package:flutter/material.dart';

class PhotoRepresentatives extends StatelessWidget {
  const PhotoRepresentatives({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          child: CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(
              'assets/images/money.jpg',
            ),
          ),
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          child: Icon(Icons.camera_alt_outlined),
        ),
      ],
    );
  }
}
