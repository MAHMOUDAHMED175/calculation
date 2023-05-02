import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Widget headerCount() => Container(
      color: ColorsApp.defualtColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
    );
