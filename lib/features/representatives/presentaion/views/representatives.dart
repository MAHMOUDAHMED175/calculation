

import 'package:cache_repo/features/representatives/presentaion/views/widgets/card_representatives.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_par.dart';

class Representative extends StatelessWidget {
  const Representative({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),

        child: CustomAppBar(
            textAppBar: 'المندوب',
            elevationAppBar: 0.0,
            showenCenterText: true,
            actionsAppBar: []),
      ),

      body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CardRepresentatives(),
            ),
          ],
        ),
    );
  }
}
