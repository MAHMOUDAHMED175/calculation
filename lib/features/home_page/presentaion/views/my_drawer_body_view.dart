import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer (
      child: Column(
        children: [
          Text('data'),
          Text('data'),
          Text('data'),
        ],
      ),
    );
  }
}
