import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/card_store.dart';
import 'package:flutter/material.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),

        child: CustomAppBar(
            textAppBar: 'المخزن',
            elevationAppBar: 0.0,
            showenCenterText: true,
            actionsAppBar: []),
      ),

      body:
      Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              // child: CardStore(),
              child: CardStore(),
            ),
          ],
        ),
    );
  }
}
