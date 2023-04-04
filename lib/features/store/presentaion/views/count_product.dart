import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/text_from_field_widget.dart';

class CountProduct extends StatelessWidget {
   CountProduct({Key? key}) : super(key: key);


   var searchCountController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBar(
            textAppBar: 'منتجات تنفذ قريبا من المخزن',
            elevationAppBar: 0.0,
            showenCenterText: true,
            actionsAppBar: []),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: defaultFormField(
                  controller: searchCountController,
                  type: TextInputType.number,
                  hintText: 'اضغط لتحديد الكميه'),
            ),
          ),
          Container(
            color: ColorsApp.defualtColor,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'الكميه',
                      style: Styles.textStyle15,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text('اسم المنتج', style: Styles.textStyle15),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
