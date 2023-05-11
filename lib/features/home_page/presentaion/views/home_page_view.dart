import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:cache_repo/features/home_page/presentaion/views/widgets/home_widgets/grid_view_widgets.dart';
import 'package:flutter/material.dart';

import 'my_drawer_body_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          textAppBar: 'الرئيسيه',
          elevationAppBar: 0.0,
          widget: Container(),
          showenCenterText: true,
          actionsAppBar: [
           IconButton(onPressed: (){}, icon: Icon(Icons.message)),
           IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active)),
          ],
        ),
      ),
       drawer: MyDrawer(),
        body: GridViewWidget()
    );
  }
}
