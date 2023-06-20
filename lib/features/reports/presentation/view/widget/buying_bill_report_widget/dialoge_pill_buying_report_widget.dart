import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Future dialogPillBuyingReportWidget(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        alignment: Alignment.center,
        content: Text(
          'هل تريد مسح الصنف من الفاتوره  ! وارجاع الصنف للمورد',
          textAlign: TextAlign.right,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'الغاء',
                  style:
                      Styles.textStyle15.copyWith(color: ColorsApp.blackText),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                },
                child: Text(
                  'حذف',
                  style:
                  Styles.textStyle15.copyWith(color: ColorsApp.blackText),
                ),
              ),

            ],
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.warning,
              color: Colors.red,
            ),
            Text('!  تحذير'),
          ],
        ),
      ),
    );
