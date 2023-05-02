import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

Widget HeaderView() => Container(
      color: ColorsApp.defualtColor,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  'الكميه ',
                  style: Styles.textStyle15,
                )),
            Expanded(flex: 2, child: Text('السعر', style: Styles.textStyle15)),
            Expanded(flex: 1, child: Text('المنتج', style: Styles.textStyle15)),
            Expanded(
                flex: 1, child: Text('صوره المنتج', style: Styles.textStyle15)),
          ],
        ),
      ),
    );
