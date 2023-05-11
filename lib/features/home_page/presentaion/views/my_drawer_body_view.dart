import 'package:cache_repo/features/home_page/presentaion/views/widgets/drawer_widgets/header.dart';
import 'package:flutter/material.dart';

import 'widgets/drawer_widgets/content.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer (
      child: SingleChildScrollView(
        child: Column(
          children: [
            headerDrawer(context),
            contextDrawer(context),

          ],
        ),
      ),
    );
  }
}
